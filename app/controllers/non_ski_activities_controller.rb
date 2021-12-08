class NonSkiActivitiesController < ApplicationController
  before_action :set_non_ski_activity, only: %i[show edit update destroy]

  def index
    @q = NonSkiActivity.ransack(params[:q])
    @non_ski_activities = @q.result(distinct: true).includes(
      :tagged_ski_area, :non_ski_reviews
    ).page(params[:page]).per(10)
  end

  def show
    @non_ski_review = NonSkiReview.new
  end

  def new
    @non_ski_activity = NonSkiActivity.new
  end

  def edit; end

  def create
    @non_ski_activity = NonSkiActivity.new(non_ski_activity_params)

    if @non_ski_activity.save
      message = "NonSkiActivity was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @non_ski_activity, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @non_ski_activity.update(non_ski_activity_params)
      redirect_to @non_ski_activity,
                  notice: "Non ski activity was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @non_ski_activity.destroy
    message = "NonSkiActivity was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to non_ski_activities_url, notice: message
    end
  end

  private

  def set_non_ski_activity
    @non_ski_activity = NonSkiActivity.find(params[:id])
  end

  def non_ski_activity_params
    params.require(:non_ski_activity).permit(:description,
                                             :tagged_ski_area_id, :title, :address)
  end
end
