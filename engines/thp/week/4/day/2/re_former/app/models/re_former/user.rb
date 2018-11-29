module ReFormer
  class User < ApplicationRecord
	validates :username, presence: true
	validates :email, presence: true
	validates :bio, presence: true
	#or validates :username, :email, :bio, presence :true
  end
  # rails g model user username email bio
end
