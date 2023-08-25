class ReviewsController < ApplicationController
  def index
    @celebrity = Celebrity.find(params[:celebrity_id])
    @reviews = @celebrity.reviews
    @review.user = current_user
  end

  def new
    @celebrity = Celebrity.find(params[:celebrity_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @celebrity = Celebrity.find(params[:celebrity_id])
    @review.celebrity = @celebrity
    @review.user = current_user
    if @review.save
      redirect_to celebrity_path(@celebrity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to celebrity_path(@review.celebrity), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
