# Utilize a task dev (lib/tasks/dev.rake)
# dev:setup / dev:add_coins / dev:add_mining_types


default_MiningTypes = [{description: "Proof of Work", initials: "PoW"}, {description: "Proof of Stake", initials: "PoS"} , {description: "Proof of Capacity", initials: "PoC"}]
default_MiningTypes.each do |miningType|
  MiningType.find_or_create_by!(miningType)
end

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


