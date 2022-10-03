class HomesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  
  def index
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end
end
