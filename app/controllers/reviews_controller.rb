class ReviewsController < ApplicationController
  def index
    @celebrity = Celebrity.find(params[:celebrity_id])
    @reviews = @celebrity.reviews
    @review.user = current_user
  end

  def new
    @celebrity = Celebrity.find(params[:celebrity_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @celebrity = Celebrity.find(params[:celebrity_id])
    @review.celebrity = @celebrity
    @review.user = current_user
    if @review.save
      redirect_to celebrity_path(@celebrity)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
