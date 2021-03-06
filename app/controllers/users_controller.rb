class UsersController < ApplicationController
# 以下デバッグ問２６
  before_action :authenticate_user!
  # 以上デバッグ
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    # 以下デバッグ
    @user = current_user
    # 以上デバッグ
    @book = Book.new
  #　以下デバッグで追記
  end
  # 以上デバッグ

  def edit
    @user = User.find(params[:id])
  end
# 以下デバッグ問１５．１６　訂正
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  # def update
  #   if @user.update(user_params)
  #     redirect_to users_path(@user), notice: "You have updated user successfully."
  #   else
  #     render "show"
  #   end
  # end
# 以上デバッグ

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
