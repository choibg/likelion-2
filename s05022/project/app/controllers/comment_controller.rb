class CommentController < ApplicationController
  def input
    c=Comment.new
    c.content = params[:h]
    c.save
  end
  def output
    @comment=Comment.all
  end 
end
