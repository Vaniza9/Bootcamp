class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    #byebug
    #b

    @products = current_user.products


    redirect_to new_user_session_path  if !user_signed_in?
end


end
