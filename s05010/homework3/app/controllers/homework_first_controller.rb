class HomeworkFirstController < ApplicationController
  def input
  end

  def output
    @val1=params[:val1]
    @val2=params[:val2]
    @val3=params[:val3]
    a=[@val1, @val2, @val3].sort 

    if (a[0]+a[1]>a[2])
      key="Triangle"
    else 
      key="Not triangle"
    end 
    @key=key
  end
end
