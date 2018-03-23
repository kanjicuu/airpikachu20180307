class StudentReviewsController < ApplicationController

  def create
    # Step 1: Check if the reservation exist (room_id, host_id, host_id)

    # Step 2: Check if the current host already reviewed the student in this reservation.

    @reservation = Reservation.where(
                    id: student_review_params[:reservation_id],
                    room_id: student_review_params[:room_id]
                   ).first

    flash[:alert] = "@reservationあったよ" if @reservation.nil?

    # @reservagtionがない時、&& 先生のuser idとstudent paramsのidが一緒だった時

    if !@reservation.nil? && @reservation.room.user.id == student_review_params[:teacher_id].to_i

      @has_reviewed = StudentReview.where(
                        reservation_id: @reservation.id,
                        teacher_id: student_review_params[:teacher_id]
                      ).first

      if @has_reviewed.nil?
          # Allow to review
          @student_review = current_user.student_reviews.create(student_review_params)
          flash[:success] = "Review created..."
      else
          # Already reviewed
          flash[:success] = "You already reviewed this Reservation"
      end
    else
      flash[:alert] = "Not found this reservation......"
    end

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @student_review = Review.find(params[:id])
    @student_review.destroy

    redirect_back(fallback_location: request.referer, notice: "Removed...!")
  end

  private
    def student_review_params
      params.require(:student_review).permit(:comment, :star, :room_id, :reservation_id, :teacher_id)
    end
end
