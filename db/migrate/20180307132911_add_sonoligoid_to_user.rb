class AddSonoligoidToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sonoligoid, :string
  end
end
