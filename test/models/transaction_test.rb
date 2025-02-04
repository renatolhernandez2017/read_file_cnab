require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  def setup
    @transaction = Transaction.new(price: 100, kind: "1")
  end

  test "should be valid" do
    assert @transaction.valid?
  end

  test "price should be present" do
    @transaction.price = nil
    assert_not @transaction.valid?
  end

  test "kind should be present" do
    @transaction.kind = ""
    assert_not @transaction.valid?
  end

  test "price should be a number" do
    @transaction.price = "abc"
    assert_not @transaction.valid?
  end

  test "price should be greater than zero" do
    @transaction.price = -1
    assert_not @transaction.valid?
  end
end
