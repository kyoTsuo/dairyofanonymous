class DraftsController < ApplicationController
  def index
    @drafts = current_user.drafts
  end

  def edit
    @user = current_user
    @draft = current_user.drafts.find(params[:id])
  end

  def create
    new_draft_params = params.require(:dairy).permit(:title, :content)

    @draft = current_user.drafts.new(new_draft_params)

    @draft.save!

  end

  private

  def draft_params
    params.require(:dairy).permit(:title, :content)
  end

end
