class TeacherReviewsController < ApplicationController

  def create
    # Step 1: Check if the reservation exist (room_id, guest_id, teacher_id)

    # Step 2: Check if the current teacher already reviewed the guest in this reservation.

    @reservation = Reservation.where(
                    id: teacher_review_params[:reservation_id],
                    room_id: teacher_review_params[:room_id],
                    user_id: teacher_review_params[:student_id]
                   ).first

    if !@reservation.nil?

      @has_reviewed = TeacherReview.where(
                        reservation_id: @reservation.id,
                        student_id: teacher_review_params[:student_id]
                      ).first

      if @has_reviewed.nil?
          # Allow to review
          @teacher_review = current_user.teacher_reviews.create(teacher_review_params)
          flash[:success] = "Review created..."
      else
          # Already reviewed
          flash[:success] = "You already reviewed this Reservation"
      end
    else
      flash[:alert] = "Not found this reservation"
    end

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @teacher_review = Review.find(params[:id])
    @teacher_review.destroy

    redirect_back(fallback_location: request.referer, notice: "Removed...!")
  end

  private
    def teacher_review_params
      params.require(:teacher_review).permit(:comment, :star, :room_id, :reservation_id, :student_id)
    end
end
