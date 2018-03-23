class AddAudioToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :title, :text
    add_column :reservations, :content, :text
    add_column :reservations, :audio, :string
  end
end
