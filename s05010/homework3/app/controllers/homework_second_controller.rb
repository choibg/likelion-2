class HomeworkSecondController < ApplicationController
  def input
  end

  def output
    @number=params[:number]
    sum=0
      0.upto(@number.length-1) do |x| 
        sum+=@number[x].to_i
      end
      @sum=sum

  end
end
