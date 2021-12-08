class SkiAreaReviewsController < ApplicationController
  before_action :set_ski_area_review, only: %i[show edit update destroy]

  # GET /ski_area_reviews
  def index
    @q = SkiAreaReview.ransack(params[:q])
    @ski_area_reviews = @q.result(distinct: true).includes(:user, :ski_area,
                                                           :friends_sent).page(params[:page]).per(10)
  end

  # GET /ski_area_reviews/1
  def show; end

  # GET /ski_area_reviews/new
  def new
    @ski_area_review = SkiAreaReview.new
  end

  # GET /ski_area_reviews/1/edit
  def edit; end

  # POST /ski_area_reviews
  def create
    @ski_area_review = SkiAreaReview.new(ski_area_review_params)

    if @ski_area_review.save
      message = "SkiAreaReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @ski_area_review, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /ski_area_reviews/1
  def update
    if @ski_area_review.update(ski_area_review_params)
      redirect_to @ski_area_review,
                  notice: "Ski area review was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /ski_area_reviews/1
  def destroy
    @ski_area_review.destroy
    message = "SkiAreaReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to ski_area_reviews_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ski_area_review
    @ski_area_review = SkiAreaReview.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def ski_area_review_params
    params.require(:ski_area_review).permit(:user_id, :ski_area_id, :review,
                                            :rating)
  end
end
