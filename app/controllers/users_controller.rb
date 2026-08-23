class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create] 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != Current.user
      redirect_to user_path(Current.user)
    end
  end

  def update
    @user = User.find(params[:id])
    unless @user.id == Current.user.id
      redirect_to books_path
    end
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @user = Current.user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  private
 
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image, :email_address, :password, :password_confirmation)
end

end