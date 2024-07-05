# This concern provides convenience methods for interacting with ranges
module RangeUtils
  extend ActiveSupport::Concern

  included do
    scope :disabled, -> { where(disabled: true) }
  end

  def format_range(range, separator: " - ")
    return end_to_s(range) if beginless?(range)
    return begin_to_s(range) if endless?(range)

    begin_to_s(range) + separator + end_to_s(range)
  end

  private

  def beginless?(range)
    range.begin == -Float::INFINITY
  end

  def endless?(range)
    range.end == Float::INFINITY
  end

  def begin_to_s(range)
    return "∞" if beginless?(range)

    range.begin.to_i.to_s
  end

  def end_to_s(range)
    return "∞" if endless?(range)

    range.end.to_i.to_s
  end
end
