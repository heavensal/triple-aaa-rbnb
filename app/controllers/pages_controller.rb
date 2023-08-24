class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
  end

  def reviews
    @my_reviews = current_user.reviews
  end

  def celebrities
    @my_celebrities = current_user.celebrities
  end

  def bookings
  end

end
