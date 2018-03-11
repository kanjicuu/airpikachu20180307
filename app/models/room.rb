class Room < ApplicationRecord
  belongs_to :user
  has_many :roomphotos

  validates :instrument, presence: true

  def cover_photo(size)
    if self.roomphotos.length > 0
      self.roomphotos[0].image.url(size)
    else
      "blank.jpg"
    end
  end

end
