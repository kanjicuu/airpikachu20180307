class Room < ApplicationRecord
  belongs_to :user
  has_many :roomphotos
  has_many :reservations

  has_many :student_reviews

  validates :instrument, presence: true

  def cover_photo(size)
    if self.roomphotos.length > 0
      self.roomphotos[0].image.url(size)
    else
      "blank.jpg"
    end
  end

  def average_rating
    student_reviews.count == 0 ? 0 : student_reviews.average(:star).round(2).to_i
  end

end
