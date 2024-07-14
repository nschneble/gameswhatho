# This concern provides convenience methods for quickly finding records
module Findable
  extend ActiveSupport::Concern

  class_methods do
    def s(name)
      find_by(name:)
    end
  end
end
