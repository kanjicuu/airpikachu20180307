class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :instrument
      t.text :summary
      t.integer :teach_years
      t.integer :exp_years
      t.integer :price
      t.string :youtube1
      t.string :youtube2
      t.string :youtube3
      t.boolean :begginer
      t.boolean :middle
      t.boolean :expert
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
