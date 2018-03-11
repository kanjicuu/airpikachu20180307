class AddInfoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :award, :text
    add_column :users, :belong, :text
    add_column :users, :twitter, :string
    add_column :users, :webpage, :string
    add_column :users, :blog, :string
  end
end
