class SkiAreasController < ApplicationController
  before_action :set_ski_area, only: [:show, :edit, :update, :destroy]

  # GET /ski_areas
  def index
    @q = SkiArea.ransack(params[:q])
    @ski_areas = @q.result(:distinct => true).includes(:ski_check_ins, :ski_area_reviews, :non_ski_activities).page(params[:page]).per(10)
  end

  # GET /ski_areas/1
  def show
    @non_ski_activity = NonSkiActivity.new
    @ski_area_review = SkiAreaReview.new
    @ski_check_in = SkiCheckIn.new
  end

  # GET /ski_areas/new
  def new
    @ski_area = SkiArea.new
  end

  # GET /ski_areas/1/edit
  def edit
  end

  # POST /ski_areas
  def create
    @ski_area = SkiArea.new(ski_area_params)

    if @ski_area.save
      redirect_to @ski_area, notice: 'Ski area was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ski_areas/1
  def update
    if @ski_area.update(ski_area_params)
      redirect_to @ski_area, notice: 'Ski area was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ski_areas/1
  def destroy
    @ski_area.destroy
    redirect_to ski_areas_url, notice: 'Ski area was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ski_area
      @ski_area = SkiArea.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ski_area_params
      params.require(:ski_area).permit(:name, :forecast, :snow_last_night, :address)
    end
end
