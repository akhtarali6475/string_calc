# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  let(:calculator) { described_class }

  describe '#add' do
    context 'when the input is an empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'when the input is a single number string' do
      it 'returns the number itself' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'when the input contains two numbers' do
      it 'returns their sum' do
        expect(calculator.add('1,5')).to eq(6)
      end
    end

    context 'when the input contains multiple numbers' do
      it 'returns the sum of all numbers' do
        expect(calculator.add('1,2,3,4')).to eq(10)
      end
    end

    context 'when the input contains new lines as delimiters' do
      it 'returns the sum of numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when the input specifies a custom delimiter' do
      it 'supports different delimiters' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end

      it 'supports another different delimiter' do
        expect(calculator.add("//|\n1|2|3")).to eq(6)
      end
    end

    context 'when the input contains negative numbers' do
      it 'raises an exception for a single negative number' do
        expect { calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
      end

      it 'raises an exception for multiple negative numbers' do
        expect { calculator.add("1,-2,-3,4") }.to raise_error("negative numbers not allowed: -2, -3")
      end
    end

    context 'when the input supports delimiters of any length' do
      it 'supports delimiters of any length' do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'when the input supports multiple delimiters' do
      it 'supports multiple delimiters' do
        expect(calculator.add("//[*][%][;]\n1*2%3;5")).to eq(11)
      end

      it 'supports multiple delimiters with different lengths' do
        expect(calculator.add("//[**][%%][;;;]\n1**2%%3;;;9")).to eq(15)
      end
    end
  end
end
