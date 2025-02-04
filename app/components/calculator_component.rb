# frozen_string_literal: true

class CalculatorComponent < ViewComponent::Base
  def initialize(transactions:)
    @transactions = transactions
    input = calculate_total([1, 4, 5, 6, 7, 8])
    output = calculate_total([2, 3, 9])
    @input = number_to_currency(input)
    @output = number_to_currency(output)
    @balance = number_to_currency([input - output, 0].max)
  end

  def calculate_total(kinds)
    @transactions.select { |transaction| kinds.include?(transaction.kind.to_i) }
      .map { |transaction| transaction.price }.sum
  end

  private

  def number_to_currency(number)
    ActiveSupport::NumberHelper.number_to_currency(number)
  end
end
