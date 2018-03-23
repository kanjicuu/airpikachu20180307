class UsersController < ApplicationController
  def show
  	@user =  User.find(params[:id])
  	@rooms = @user.rooms.where(active: true)

  	# Display all the guest reviews to host (if this user is a host)
    @student_reviews = Review.where(type: "StudentReview", teacher_id: @user.id)

    # Display all the host reviews to host (if this user is a guest)
    @teacher_reviews = Review.where(type: "TeacherReview", student_id: @user.id)
  end
end
