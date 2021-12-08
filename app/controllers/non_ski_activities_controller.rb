class NonSkiActivitiesController < ApplicationController
  before_action :set_non_ski_activity, only: [:show, :edit, :update, :destroy]

  # GET /non_ski_activities
  def index
    @non_ski_activities = NonSkiActivity.all
  end

  # GET /non_ski_activities/1
  def show
  end

  # GET /non_ski_activities/new
  def new
    @non_ski_activity = NonSkiActivity.new
  end

  # GET /non_ski_activities/1/edit
  def edit
  end

  # POST /non_ski_activities
  def create
    @non_ski_activity = NonSkiActivity.new(non_ski_activity_params)

    if @non_ski_activity.save
      redirect_to @non_ski_activity, notice: 'Non ski activity was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /non_ski_activities/1
  def update
    if @non_ski_activity.update(non_ski_activity_params)
      redirect_to @non_ski_activity, notice: 'Non ski activity was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /non_ski_activities/1
  def destroy
    @non_ski_activity.destroy
    redirect_to non_ski_activities_url, notice: 'Non ski activity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_non_ski_activity
      @non_ski_activity = NonSkiActivity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def non_ski_activity_params
      params.require(:non_ski_activity).permit(:description, :tagged_ski_area_id, :title, :address)
    end
end
