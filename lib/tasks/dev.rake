namespace :dev do
  if Rails.env.development?
    def run_spinner text
      spinner = TTY::Spinner.new("[:spinner] #{text}")
      spinner.auto_spin
      yield
      spinner.success("(Concluido!)")
    end  

    desc "Remove os antigos assets e pre-compila os novos!"
    task assets: :environment do
      run_spinner "Removendo antigos assets..." do 
        %x(rails assets:clobber)
      end

      run_spinner "Compilando novos assets..." do 
        %x(rails assets:precompile)
      end
    end

    desc "Faz todo o processo para upload e commit git/heroku!"
    task heroku_and_git_push: :environment do
      run_spinner "Iniciando repositorio..." do 
        %x(git init)
      end

      run_spinner "Adicionando arquivos ao repositorio..." do 
        %x(git add .)
      end

      run_spinner "Faz o commit..." do 
        %x(git commit -m "---")
      end

      run_spinner "Envia para producao no heroku..." do 
        %x(git push heroku master)
      end
    end
  
    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
        run_spinner("Criando BD...") { %x(rails db:create) }
        run_spinner("Migrando BD...") { %x(rails db:migrate) }
        run_spinner("Realizando Seed...") { %x(rails db:seed) }
        %x(rails dev:add_mining_types)
        %x(rails dev:add_coins)
    end

    desc "Cadastro de moedas padrões"
    task add_coins: :environment do
      run_spinner "Verificando e cadastrando moedas padrões" do 
        default_Coins = [
          {
              descripition: "Bitcoin",
              acronym: "BTC",
              url_image: "btc_ico.png",
              mining_type: MiningType.find_by(initials: "PoW")
          },
          {
              descripition: "Etherum",
              acronym: "ETH",
              url_image: "eth_ico.png",
              mining_type: MiningType.all.sample
          },
          {
              descripition: "Monero",
              acronym: "XMR",
              url_image: "tether_ico.png",
              mining_type: MiningType.all.sample
          },
          {
              descripition: "Tether",
              acronym: "USDT",
              url_image: "xmr_ico.png",
              mining_type: MiningType.all.sample
          }
        ]
        default_Coins.each do |coin|
          Coin.find_or_create_by!(coin)
        end
      end
    end
  
    desc "Cadastro de tipos de mineração padrões"
    task add_mining_types: :environment do
      run_spinner "Cadastrando os tipos de mineração padrões" do
        default_MiningTypes = [{description: "Proof of Work", initials: "PoW"}, {description: "Proof of Stake", initials: "PoS"} , {description: "Proof of Capacity", initials: "PoC"}]
        default_MiningTypes.each do |miningType|
          MiningType.find_or_create_by!(miningType)
        end
      end
    end
  else
    "Voce nao esta em ambiente de desenvolvimento!" 
  end
end
