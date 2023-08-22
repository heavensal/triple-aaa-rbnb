class CelebritiesController < ApplicationController
  def index
    @celebrities = Celebrity.all
  end

  def show
    @celebrity = Celebrity.find(params[:id])
    @bookings = @celebrity.bookings

  end

  def new
    @celebrity = Celebrity.new
  end

  def create
    @celebrity = Celebrity.new(celebrities_params)
    @celebrity.user = current_user
    if @celebrity.save!
      redirect_to celebrity_path(@celebrity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @celebrity = Celebrity.find(params[:id])
  end

  def update
    @celebrity = Celebrity.find(params[:id])
    if @celebrity.update!(celebrities_params)
      redirect_to celebrity_path(@celebrity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @celebrity = Celebrity.find(params[:id])
    @celebrity.destroy
    redirect_to celebrities_path
  end

  private

  def celebrities_params
    params.require(:celebrity).permit(:name, :rating, :price, photos: [])
  end
end
