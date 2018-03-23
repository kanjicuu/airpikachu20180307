class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :fullname, presence: true, length: {maximum: 50}
  validates :sonoligoid, presence: true, length: {in: 5..20}, uniqueness: true, format: { with: /\A[a-z0-9]+\z/i }  # やっぱり半角英数字のみだよね！
  # validates :webpage, format: /\A#{URI::regexp(%w(http https))}\z/ , if: :should_validate_webpage?
  # validates :blog, format: /\A#{URI::regexp(%w(http https))}\z/ , if: :should_validate_blog?

  has_many :rooms 
  has_many :reservations
  
  has_many :student_reviews, class_name: "StudentReview", foreign_key: "student_id"
  has_many :teacher_reviews, class_name: "TeacherReview", foreign_key: "teacher_id"  

  def should_validate_webpage?
    new_record? || webpage.present?
  end   
  
  def should_validate_blog?
    new_record? || blog.present?
  end
end
