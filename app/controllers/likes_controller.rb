class LikesController < ApplicationController
  def create
    review = Review.find params[:review_id]
    like = Like.new(review: review, user: current_user)

    if !can?(:like, review) # negate the result of can?(:like, review). So if a user CAN NOT like this review it will trigger this if
      flash[:warning] = "You can not like your own review"
    elsif like.save
      flash[:success] = "Review Liked"
    else
      flash[:danger] = "Unable to Like this Review"
    end
    redirect_to product_path(review.product)
  end

  def destroy
  end
end
