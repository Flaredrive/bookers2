class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to homes_about_path, notice: "signed in successfully."
    else
      flash.now[:alert] = "Try another name or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to homes_about_path, notice: "signed out successfully."
  end
end