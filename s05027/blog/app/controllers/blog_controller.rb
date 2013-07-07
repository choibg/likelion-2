class BlogController < ApplicationController
  def write 
  end
  def write_complete
    name = params[:writer]
    content = params[:cont]

    new_post = Post.new
    new_post.username = name
    new_post.content = content
    new_post.save 

    render :text =>"Complete" 
  end 
  def list 
    @post = Post.all
  end
end
