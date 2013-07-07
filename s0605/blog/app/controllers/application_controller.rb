class ApplicationController < ActionController::Base
#protect_from_forgery
  before_filter:login_check
  def login_check
    @user=nil
    if !session[:user_id].nil?
      @user=User.find(session[:user_id])

    else
      redirect_to :action => 'login'
    end
  end
end
