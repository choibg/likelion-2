class UserController < ApplicationController
  def signup
    new_user = User.new
    new_user.username = params["username"] 
    new_user.password_hash =User.generate_password(params[:password]) 
    new_user.save 
  end
  private
  def generate_password
  end
end
