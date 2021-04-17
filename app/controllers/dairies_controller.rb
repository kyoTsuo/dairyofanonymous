class DairiesController < ApplicationController
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

  def create
    dairy = Dairy.new(dairy_params)
    dairy.save!
    redirect_to dairies_url, notice: "日記#{dairy.title}を投稿しました。"
  end

  private
  
  def dairy_params
    params.require(:dairy).permit(:title, :content)
  end

end
