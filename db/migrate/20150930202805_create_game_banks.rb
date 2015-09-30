class CreateGameBanks < ActiveRecord::Migration
  def change
    create_table :game_banks do |t|
      t.string :party
      t.string :description
      t.string :trans_type
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
