class BlogController < ApplicationController

  def write
  end
  def write_complete

    name = params[:writer]
    content = params[:cont]

    new_post = Post.new
      new_post.username = name  #new_post.username = params[:writer]
      new_post.content = content #new_post.content = params[:cont]
      new_post.save # Post.cerate(:username = > params[:writer], :content =>params[:cont]

              redirect_to :action => 'list' 
  end

  def list
    @post = Post.all #@means to show in view file  
  end

  def delete_post
    to_be_deleted = Post.find(params[:id]) 
    to_be_deleted.delete 

    redirect_to :action => 'list' 
  end

  def edit_post
    @edit_id = params[:id]
    @edit_name = params[:writer]
    @edit_cont = params[:cont] 
  end

  def edit_complete
    name = params[:writer]
    content = params[:cont]

    to_be_edited = Post.find(params[:id_number])
    to_be_edited.username = name 
    to_be_edited.content = content 
    to_be_edited.save 
      redirect_to :action => 'list'
  end
  def submit_reply 
    reply = Comment.new
    reply.username = params[:username]
    reply.content = params[:content]
    reply.like_cnt = 0
    reply.post_id = params[:id] 
    reply.save 
  end 


end
