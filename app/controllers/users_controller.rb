class UsersController < ApplicationController
  before_filter :authorize_api_user!

  def me
    respond_with @current_user
  end
end