class CreateOracleCards < ActiveRecord::Migration[7.1]
  def change
    create_table :oracle_cards do |t|
      t.integer :number
      t.string :title
      t.text :description
      t.text :message
      t.string :image_url

      t.timestamps
    end
  end
end
