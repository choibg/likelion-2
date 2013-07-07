class UserController < ApplicationController
  def login
    @my_ip=request.remote_ip
  end
  
  def email_form 
  end
  
  def email_send
    @email=params[:email]
    @content=params[:content]
  end
end
