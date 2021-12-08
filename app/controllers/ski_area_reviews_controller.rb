class SkiAreaReviewsController < ApplicationController
  before_action :set_ski_area_review, only: %i[show edit update destroy]

  def index
    @q = SkiAreaReview.ransack(params[:q])
    @ski_area_reviews = @q.result(distinct: true).includes(:user, :ski_area,
                                                           :friends_sent).page(params[:page]).per(10)
  end

  def show; end

  def new
    @ski_area_review = SkiAreaReview.new
  end

  def edit; end

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

  def update
    if @ski_area_review.update(ski_area_review_params)
      redirect_to @ski_area_review,
                  notice: "Ski area review was successfully updated."
    else
      render :edit
    end
  end

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

  def set_ski_area_review
    @ski_area_review = SkiAreaReview.find(params[:id])
  end

  def ski_area_review_params
    params.require(:ski_area_review).permit(:user_id, :ski_area_id, :review,
                                            :rating)
  end
end
