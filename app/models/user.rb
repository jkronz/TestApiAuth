class User < ActiveRecord::Base
  include Concerns::ApiToken

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def as_json(options={})
    super(options.merge(except: [:api_token])).merge('authorization_token' => issue_token)
  end
end
