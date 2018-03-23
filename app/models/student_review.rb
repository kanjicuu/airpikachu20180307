class StudentReview < Review
  belongs_to :student, class_name: "User"
end
