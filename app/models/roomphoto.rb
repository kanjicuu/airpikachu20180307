class Roomphoto < ApplicationRecord
  belongs_to :room
  
  has_attached_file :image, styles: { slider: "x600", medium: "600x600>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
