#encoding=utf-8
class BlogController < ApplicationController
  skip_before_filter:login_check, :only=>[:login, :login_process, :join, :join_process]
  def index

    @posts=Post.all
    @user=User.find(session[:user_id])
  end
  
  def write_process
    post=Post.new
    post.username=params[:username_from_view]
    post.content=params[:content_from_view]
    post.save

    redirect_to :action =>'index' 
  end

  
  def update
    @post=Post.find(params[:id])
  end

  def update_process
    post=Post.find(params[:id])
    post.username=params[:username_from_view]
    post.content=params[:content_from_view]
    post.save 

      redirect_to:action =>'index'
  end
  def delete_post
    post=Post.find(params[:id])
    post.destroy
    redirect_to :action =>'index'
  end
  def reply_process
    reply=Comment.new
    reply.post_id=params[:id]
    reply.username=params[:reply_username_from_view]
    reply.content=params[:reply_content_from_view]
    reply.save 

    redirect_to:action =>'index' 
  end
  def login
    
  end
  
  def login_process
      user=User.find_by_username(params[:username])
    if user.nil?
      render:text => "아이디 또는 비밀번호가 올바르지 않습니다. " 
    else
      if user.passwd != params[:password]
        render:text=>"아이디 또는 비밀번호가 올바르지 않습니다."
      else
        session[:user_id]=user.id
        redirect_to :action => 'index'

    end
  end
  end
  
  def join_process
    user=User.new
    user.username=params[:username]
    user.passwd=params[:password]
    user.save

    redirect_to:action =>'index'
  end 
  def join
  end
  def logout
    session[:user_id]=nil
  end

end
