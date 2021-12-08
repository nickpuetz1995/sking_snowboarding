class NonSkiReviewsController < ApplicationController
  before_action :set_non_ski_review, only: %i[show edit update destroy]

  def index
    @q = NonSkiReview.ransack(params[:q])
    @non_ski_reviews = @q.result(distinct: true).includes(:user,
                                                          :non_ski_activity, :friends_sent).page(params[:page]).per(10)
  end

  def show; end

  def new
    @non_ski_review = NonSkiReview.new
  end

  def edit; end

  def create
    @non_ski_review = NonSkiReview.new(non_ski_review_params)

    if @non_ski_review.save
      message = "NonSkiReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @non_ski_review, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @non_ski_review.update(non_ski_review_params)
      redirect_to @non_ski_review,
                  notice: "Non ski review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @non_ski_review.destroy
    message = "NonSkiReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to non_ski_reviews_url, notice: message
    end
  end

  private

  def set_non_ski_review
    @non_ski_review = NonSkiReview.find(params[:id])
  end

  def non_ski_review_params
    params.require(:non_ski_review).permit(:non_ski_activity_id, :user_id,
                                           :review, :rating)
  end
end
