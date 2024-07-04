# This is the base for all other controllers
class ApplicationController < ActionController::Base
  include Localizable
  include Pagy::Backend

  before_action :turbo_frame_request_variant

  private

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
