class SkiCheckInsController < ApplicationController
  before_action :set_ski_check_in, only: [:show, :edit, :update, :destroy]

  # GET /ski_check_ins
  def index
    @ski_check_ins = SkiCheckIn.all
  end

  # GET /ski_check_ins/1
  def show
  end

  # GET /ski_check_ins/new
  def new
    @ski_check_in = SkiCheckIn.new
  end

  # GET /ski_check_ins/1/edit
  def edit
  end

  # POST /ski_check_ins
  def create
    @ski_check_in = SkiCheckIn.new(ski_check_in_params)

    if @ski_check_in.save
      redirect_to @ski_check_in, notice: 'Ski check in was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ski_check_ins/1
  def update
    if @ski_check_in.update(ski_check_in_params)
      redirect_to @ski_check_in, notice: 'Ski check in was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ski_check_ins/1
  def destroy
    @ski_check_in.destroy
    redirect_to ski_check_ins_url, notice: 'Ski check in was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ski_check_in
      @ski_check_in = SkiCheckIn.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ski_check_in_params
      params.require(:ski_check_in).permit(:user_id, :ski_area_id)
    end
end
