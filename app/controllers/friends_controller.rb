class FriendsController < ApplicationController
  before_action :current_user_must_be_friend_friend_sender, only: [:edit, :update, :destroy] 

  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  def index
    @friends = Friend.page(params[:page]).per(10)
  end

  # GET /friends/1
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      message = 'Friend was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @friend, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /friends/1
  def update
    if @friend.update(friend_params)
      redirect_to @friend, notice: 'Friend was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /friends/1
  def destroy
    @friend.destroy
    message = "Friend was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to friends_url, notice: message
    end
  end


  private

  def current_user_must_be_friend_friend_sender
    set_friend
    unless current_user == @friend.friend_sender
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friend_params
      params.require(:friend).permit(:friend_sender_id, :friend_recipient_id)
    end
end
