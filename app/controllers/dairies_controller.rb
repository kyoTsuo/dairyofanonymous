class DairiesController < ApplicationController

    before_action :set_dairy, only: [:edit, :update, :destroy]

  def index
    @dairies = Dairy.all.order(id: "DESC")
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
    if params[:drafted]
      @dairy.drafted = true
      @dairy.published = false
      comment = "下書きに保存しました。"
    elsif params[:unpublished]
      @dairy.drafted = false
      @dairy.published = false
      comment = "非公開で投稿しました。"
    elsif params[:published]
      @dairy.drafted = false
      @dairy.published = true
      comment = "公開で投稿しました。"
    end

    if @dairy.update(dairy_params)
      redirect_to home_url, notice: comment
    else
      render :edit
    end
  end

  def destroy
    @dairy.destroy
  end

  def create
    @dairy = current_user.dairies.new(dairy_params)

    if params[:drafted]
      @dairy.drafted = true
      comment = "下書きに保存しました。"
    elsif params[:unpublished]
      comment = "非公開で投稿しました。"
    elsif params[:published]
      @dairy.published = true
      comment = "公開で投稿しました。"
    end

    if @dairy.save
      redirect_to home_url, notice: comment
    else
      render :new
    end
  end

  def draft
    @dairies = current_user.dairies.order(id: "DESC")
  end

  private
  
  def dairy_params
    params.require(:dairy).permit(:title, :content, :published, :drafted)
  end

  def set_dairy
    @dairy = current_user.dairies.find(params[:id])
  end

end
