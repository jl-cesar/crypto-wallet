class Coin < ApplicationRecord
    belongs_to(:mining_type) # Faz o model Coin pertencer a outro Model (MiningType)
end
