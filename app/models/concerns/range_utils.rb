# This concern provides convenience methods for interacting with ranges
module RangeUtils
  extend ActiveSupport::Concern

  def format_range(range)
    if not_so_much_a_range_as_an_integer?(range)
      range.to_fs(:zero)
    elsif endless?(range)
      "#{range.to_fs(:zero)}+"
    else
      range.to_fs(:dash)
    end
  end

  def highest(range)
    if endless?(range) # can't do shit with infinity
      range.begin
    else
      range.end
    end
  end

  private

  def not_so_much_a_range_as_an_integer?(range)
    range.begin == range.end - 1 # range ends are exclusive
  end

  def endless?(range)
    range.end == Float::INFINITY
  end
end
