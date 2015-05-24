class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  acts_as_token_authentication_handler_for User
end
