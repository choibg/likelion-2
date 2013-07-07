require 'digest/md5'
class UserController < ApplicationController
  def join
  end
  def join_process
    u=User.new
    u.username=params[:username]
    u.realname=params[:realname]
    u.passwd=Digest::MD5.hexdigest(params[:passwd])
    u.phone_number=params[:phone]
    u.save

    redirect_to:controller =>'user', :action=> 'join'

  end

  def login_process
    u=User.find_by_username(params[:username])
      if u.nill?
        redirect_to:controller=>'blog',:action=>'join'
      elsif u.passwd==params[:passwd]

        session[:user]=u
        redirect_to:controller=>'blog',:action=>'join'

      else
        redirect_to:controller=>'blog',:action=>'join'
      end 
      
  end
  def logout 
    reset_session
    redirect_to:controller =>'blog',:action=>'join'
  end
end
