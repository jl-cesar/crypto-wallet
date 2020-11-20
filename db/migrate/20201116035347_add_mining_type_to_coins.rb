class AddMiningTypeToCoins < ActiveRecord::Migration[5.2]
  def change
    add_reference :coins, :mining_type, foreign_key: true # Exporta o campo mining_type (acha a tabela pelo nome do model no singular, ou seja, mining_type) para a tabela coins (estrangeira)
  end
end
