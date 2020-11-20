class MiningType < ApplicationRecord
    has_many(:coins) # Consegue acessar as moedas que utilizam de um ID de um certo tipo de mineracao
end
