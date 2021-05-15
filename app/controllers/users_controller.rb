class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    favorites = Favorite.where(user_id: current_user.id).pluck(:dairy_id)
    @favorite_list = Dairy.find(favorites)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user), notice: "ユーザーを登録しました。"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "ユーザーを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "ユーザーを削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
