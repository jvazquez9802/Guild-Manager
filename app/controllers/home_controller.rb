class HomeController < ApplicationController
  def index
    if !current_user
      redirect_to new_session_path
    end
  end
end
