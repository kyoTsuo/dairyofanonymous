class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(user_id: current_user.id, dairy_id: params[:dairy_id])
    if @favorite.save
      redirect_to dairies_url, notice: "お気に入りを登録しました。"
    end

  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, dairy_id: params[:dairy_id])
    @favorite.destroy
    redirect_to dairies_url, notice: "お気に入りを削除しました。"
  end

end
