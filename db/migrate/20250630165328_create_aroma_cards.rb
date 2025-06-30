class CreateAromaCards < ActiveRecord::Migration[7.1]
  def change
    create_table :aroma_cards do |t|
      t.string :title
      t.text :description
      t.text :message

      t.timestamps
    end
  end
end
