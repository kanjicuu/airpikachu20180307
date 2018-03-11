class AddAuthToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :teacher_auth, :boolean
  end
end
