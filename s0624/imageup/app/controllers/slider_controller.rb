class SliderController < ApplicationController
  def index
  end

  def upload
  end

  def upload_process
    img = Photodb.new
    img.filename = params[:img].original_filename
#파일이 넘어올 때 많은 >> 정보들이 같이 날라오기 때문에 그 중 원래파일명만 
    img.image = params[:img].read
    img.save 
  end
end
