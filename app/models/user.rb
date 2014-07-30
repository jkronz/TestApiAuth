class User < ActiveRecord::Base
  include Concerns::ApiToken
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

end
