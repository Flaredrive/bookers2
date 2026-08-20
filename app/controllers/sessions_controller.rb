class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  #skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      start_new_session_for user
      redirect_to user_path(user), notice: "signed in successfully."
    else
      flash.now[:alert] = "Try another name or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    terminate_session
    redirect_to homes_about_path, notice: "signed out successfully."
  end
end