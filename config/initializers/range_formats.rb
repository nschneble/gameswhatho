Range::RANGE_FORMATS[:dash] = ->(start, stop) { "#{start} - #{stop - 1}" }
Range::RANGE_FORMATS[:zero] = ->(start, _stop) { start.to_s }
