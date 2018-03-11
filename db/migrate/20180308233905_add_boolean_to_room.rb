class AddBooleanToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :active, :boolean, default: false
    add_column :rooms, :teacher_apply, :boolean, default: false
  end
end
