class SkiCheckInsController < ApplicationController
  before_action :set_ski_check_in, only: %i[show edit update destroy]

  def index
    @q = SkiCheckIn.ransack(params[:q])
    @ski_check_ins = @q.result(distinct: true).includes(:user, :ski_area,
                                                        :friends_sent).page(params[:page]).per(10)
  end

  def show; end

  def new
    @ski_check_in = SkiCheckIn.new
  end

  def edit; end

  def create
    @ski_check_in = SkiCheckIn.new(ski_check_in_params)

    if @ski_check_in.save
      message = "SkiCheckIn was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @ski_check_in, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @ski_check_in.update(ski_check_in_params)
      redirect_to @ski_check_in,
                  notice: "Ski check in was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @ski_check_in.destroy
    message = "SkiCheckIn was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to ski_check_ins_url, notice: message
    end
  end

  private

  def set_ski_check_in
    @ski_check_in = SkiCheckIn.find(params[:id])
  end

  def ski_check_in_params
    params.require(:ski_check_in).permit(:user_id, :ski_area_id)
  end
end
