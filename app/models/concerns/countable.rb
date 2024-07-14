# This concern provides convenience methods for quickly counting records
module Countable
  extend ActiveSupport::Concern

  class_methods do
    def num_records(include_label: true)
      num_records = count
      return num_records unless include_label

      return "#{num_records} #{name.downcase}" if num_records == 1

      "#{num_records} #{name.pluralize.downcase}"
    end
  end
end
