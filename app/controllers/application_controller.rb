# This is the base for all other controllers
class ApplicationController < ActionController::Base
  include Localizable
  include Pagy::Backend
end
