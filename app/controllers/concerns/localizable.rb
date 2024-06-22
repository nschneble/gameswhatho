require "active_support/concern"

# This concern provides localized notices for controller actions
module Localizable
  extend ActiveSupport::Concern

  included do
    scope :disabled, -> { where(disabled: true) }
  end

  class_methods do
    def notice(model, action)
      model.class.name + I18n.t("controllers.#{action}")
    end
  end
end
