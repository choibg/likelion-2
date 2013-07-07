class UserController < ApplicationController
  def home
  end
  def output
    @data=params[:view_data]
    phone=Snuphone.new
    phone.address=@data
    phone.save 
  end
end
