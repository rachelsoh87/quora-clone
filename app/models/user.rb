require 'byebug'
class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  validates :email, uniqueness: true,
                    presence: true,
                    format: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/,
                    length: { maximum: 100 }

  validates :password, presence: true

  def self.authenticate(email, password)
  	User.all.each do |user|
  		byebug
	  	if user.email == email && user.password == password
	  		return user 
	  	end
	  end
  	return nil
  end

end