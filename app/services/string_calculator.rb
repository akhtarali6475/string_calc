# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      custom_delimiter, numbers = numbers.split("\n", 2)
      delimiter = Regexp.new(Regexp.escape(custom_delimiter[2..]))
    end
    numbers.split(delimiter).map(&:to_i).sum
  end
end
