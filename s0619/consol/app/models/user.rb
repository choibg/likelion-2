require 'digest/sha1'
class User < ActiveRecord::Base

  # attr_accessible :title, :body
  def method1
    puts "method1"
  end
  def self.method2
    puts "method2"
  end
  def generate_password (origin_password)

     self.password_hash = Digest::SHA1.hexdigest(origin_password)
  end
  def self.generate_password2 (origin_password)
    return Digest::SHA1.hexdigest (origin_password)
  end
end
