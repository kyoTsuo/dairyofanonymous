class DairiesController < ApplicationController

    before_action :set_dairy, only: [:edit, :update, :destroy]

  def index
    @dairies = Dairy.all
  end

  def show
    @dairy = Dairy.find(params[:id])
  end

  def new
    @dairy = Dairy.new
  end

  def edit
  end

  def update
    if @dairy.update(dairy_params)
      redirect_to dairies_url, notice: "日記#{@dairy.title}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @dairy.destroy
    redirect_to dairies_url, notice: "日記#{@dairy.title}を削除しました。"
  end

  def create
    @dairy = current_user.dairies.new(dairy_params)

    if @dairy.save
      redirect_to dairies_url, notice: "日記#{@dairy.title}を投稿しました。"
    else
      render :new
    end
  end

  private
  
  def dairy_params
    params.require(:dairy).permit(:title, :content)
  end

  def set_dairy
    @dairy = current_user.dairies.find(params[:id])
  end

end
