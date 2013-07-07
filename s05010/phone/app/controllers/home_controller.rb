class HomeController < ApplicationController
  def input
  end

  def output
    p=Myphone.new
      p.phone_number=params[:phone_number]
      p.save 
      @l=Myphone.all
    
  end
end
