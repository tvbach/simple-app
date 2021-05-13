class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    @micropost = current_user.microposts.build
    @feed_items = User.feed(current_user.id)
                      .order_micropost
                      .page(params[:page])
                      .per(10)
  end

  def help; end

  def about; end
end
