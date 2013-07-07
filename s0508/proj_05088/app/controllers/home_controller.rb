class HomeController < ApplicationController
  def input
  end

  def output
    @word_hash=Hash.new
    bill_text=params[:input_text].split("")
    bill_text.each do |x|
      if !@word_hash.has_key?(x)
        @word_hash[x]=1
      else
        @word_hash[x]+=1
      end
    end
  end
end
