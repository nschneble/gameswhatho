# This concern provides localized notices for controller actions
module Localizable
  extend ActiveSupport::Concern

  def notice_t(model, action)
    model.class.name + I18n.t("controllers.#{action}")
  end
end
