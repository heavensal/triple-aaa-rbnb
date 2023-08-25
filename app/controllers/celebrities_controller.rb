class CelebritiesController < ApplicationController
  def index
    @celebrities = Celebrity.all
    if params[:query].present?
      @celebrities = Celebrity.global_search(params[:query])
    end
  end

  def show
    @celebrity = Celebrity.find(params[:id])
    authorize @celebrity
    @bookings = @celebrity.bookings
    @reviews = @celebrity.reviews
    rating
  end

  def new
    @celebrity = Celebrity.new
    authorize @celebrity
    @celebrities = Celebrity.all
    @markers = @celebrities.map do |celebrity|
      {
        lat: celebrity.latitude,
        lng: celebrity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { celebrity: celebrity }),
        marker_html: render_to_string(partial: "marker", locals: { celebrity: celebrity })
      }
    end
  end

  def create
    @celebrity = Celebrity.new(celebrities_params)
    authorize @celebrity
    @celebrity.user = current_user
    if @celebrity.save!
      redirect_to celebrity_path(@celebrity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @celebrity = Celebrity.find(params[:id])
    authorize @celebrity
  end

  def update
    @celebrity = Celebrity.find(params[:id])
    authorize @celebrity
    if @celebrity.update!(celebrities_params)
      redirect_to celebrity_path(@celebrity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @celebrity = Celebrity.find(params[:id])
    authorize @celebrity
    @celebrity.destroy
    redirect_to celebrities_path
  end

  private

  def celebrities_params
    params.require(:celebrity).permit(:name, :rating, :address, :price, photos: [])
  end

  def rating
    @celebrity = Celebrity.find(params[:id])
    sum = 0
    if @celebrity.reviews.empty? == false
      @celebrity.reviews.each do |review|
        sum += review.rating
      end
      @celebrity.update!(rating: sum.fdiv(@celebrity.reviews.size).round(1))
    else
      @celebrity.rating = 0
    end
  end
end
