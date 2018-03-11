class AddAttachmentImageToRoomphotos < ActiveRecord::Migration
  def self.up
    change_table :roomphotos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :roomphotos, :image
  end
end
