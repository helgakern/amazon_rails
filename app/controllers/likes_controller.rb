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
    like = Like.find params[:id]

    # like.destroy unless !can?(:destroy, review)
    # like.destroy unless cannot?(:destroy, like.review)
    if cannot?(:destroy, like)
      flash[:warning] = "You don't own this like, so you can't destroy it"
    elsif like.destroy
      flash[:success] = "Unliked"
    else
      flash[:danger] = "Once you've you liked this you can not unlike"
    end

    redirect_to product_path(like.review.product)
  end
end
