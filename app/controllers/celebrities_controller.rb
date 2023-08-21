class CelebritiesController < ApplicationController
  def index
    @celebrities = Celebrity.all
  end

  def show
    @celebrity = Celebrity.find(params[:id])
  end

  def new
    @celebrity = Celebrity.new
  end

  def create
    @celebrity = Celebrity.new(celebrities_params)
    if @celebrity.save
      redirect_to celebrity_path(@celebrity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @celebrity = Celebrity.find(celebrities_params)
  end

  def update
    @celebrity = Celebrity.update(celebrities_params)
    if @celebrity.save
      redirect_to celebrity_path(@celebrity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @celebrity = Celebrity.destroy
    redirect_to celebrities_path
  end

  private

  def celebrities_params
    params.require(:celebrity).permit(:name, :rating, :price)
  end

end
