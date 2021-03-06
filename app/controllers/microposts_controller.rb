class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build micropost_params
    if @micropost.save
      flash[:success] = "Create micropost succsess"
      redirect_to user_path current_user
    else
      render "static_pages/home"
    end
  end

  def destroy
    @micropost.destroy
    respond_to :js
  end

  private

  def micropost_params
    params.require(:micropost).permit :content
  end

  def correct_user
    @micropost = current_user.microposts.find params[:id]
    redirect_to root_url if @micropost.nil?
  end
end
