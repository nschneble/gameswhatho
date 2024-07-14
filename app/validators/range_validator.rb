# This validator ensures a valid integer range
class RangeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    allow_infinity = ActiveModel::Type::Boolean.new.cast(options[:allow_infinity])

    record.errors.add(attribute, :must_not_be_infinity) unless bounded?(value, allow_infinity:)
    record.errors.add(attribute, :must_be_positive) unless positive?(value)
    record.errors.add(attribute, :must_be_ascending) unless ascending?(value)
  end

  private

  def bounded?(range, allow_infinity:)
    return true if allow_infinity

    range.size != Float::INFINITY
  end

  def positive?(range)
    range.begin.positive? && range.end.positive?
  end

  def ascending?(range)
    if range.exclude_end?
      range.begin < range.end
    else
      range.begin <= range.end
    end
  end
end
