class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def top
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end

  def about
  end
end
