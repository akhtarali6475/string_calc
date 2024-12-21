# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      custom_delimiter, numbers = numbers.split("\n", 2)
      delimiter = Regexp.new(Regexp.escape(custom_delimiter[2..]))
    end

    numbers_list = numbers.split(delimiter).map(&:to_i)
    validate_no_negatives(numbers_list)

    numbers_list.sum
  end

  private

  def validate_no_negatives(numbers)
    negatives = numbers.select(&:negative?)
    return if negatives.empty?

    raise "negative numbers not allowed: #{negatives.join(', ')}"
  end
end
