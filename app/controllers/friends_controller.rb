class FriendsController < ApplicationController
  before_action :current_user_must_be_friend_friend_sender,
                only: %i[edit update destroy]

  before_action :set_friend, only: %i[show edit update destroy]

  def index
    @q = Friend.ransack(params[:q])
    @friends = @q.result(distinct: true).includes(:friend_sender,
                                                  :friend_recipient, :ski_area_review, :non_ski_review, :ski_check_in).page(params[:page]).per(10)
  end

  def show; end

  def new
    @friend = Friend.new
  end

  def edit; end

  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      message = "Friend was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @friend, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @friend.update(friend_params)
      redirect_to @friend, notice: "Friend was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @friend.destroy
    message = "Friend was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to friends_url, notice: message
    end
  end

  private

  def current_user_must_be_friend_friend_sender
    set_friend
    unless current_user == @friend.friend_sender
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:friend_sender_id, :friend_recipient_id)
  end
end
