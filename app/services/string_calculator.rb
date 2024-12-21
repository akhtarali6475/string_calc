# frozen_string_literal: true

class StringCalculator
  class << self
    def add(numbers)
      return 0 if numbers.empty?

      delimiter = /,|\n/
      delimiter, numbers = parse_custom_delimiter(numbers) if numbers.start_with?('//')
      number_list = numbers.split(delimiter).map(&:to_i)
      number_list.reject! { |num| num > 1000 } # Ignore numbers larger than 1000
      validate_no_negatives(number_list)
      number_list.sum
    end

    private

    def parse_custom_delimiter(numbers)
      parts = numbers.split("\n", 2)
      custom_delimiter = Regexp.escape(parts.first[2..-1]).split('').map { |char| '\\' + char }.join('|')
      [Regexp.new(custom_delimiter), parts.last]
    end

    def validate_no_negatives(numbers)
      negatives = numbers.select(&:negative?)
      return if negatives.empty?

      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end
  end
end
