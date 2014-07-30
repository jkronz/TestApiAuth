class ApplicationController < ActionController::Base
  # We're an API, everything is cross site.
  # protect_from_forgery with: :exception
end
