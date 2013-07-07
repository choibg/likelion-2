#encoding:utf-8
class MailController < ApplicationController
  def email_form
  end

  def email_send
    @email=params[:email]
    @subject=params[:subject]
    @content=params[:content]
    email=@email
    subject=@subject
    content=@content
    gmail=Gmail.connect("choibg0417@gmail.com","xxxxxxxxxx")
      gmail.deliver do 
        to email
        subject subject
        text_part do 
          body content
        end
      gmail.logout 
    end
  end

end
