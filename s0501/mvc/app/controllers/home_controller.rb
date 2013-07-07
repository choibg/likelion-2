class HomeController < ApplicationController
  def hello
    @name=params[:my_name] #@를 붙여주면 view에서 사용가능 
  end

end
