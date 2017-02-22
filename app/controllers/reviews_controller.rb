class ReviewsController < ApplicationController

  # GET /reviews/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = restaurant
    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant, notice: 'Review was successfully created.' }
        format.json { redirect_to restaurant, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
