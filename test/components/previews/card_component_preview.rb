# frozen_string_literal: true

class CardComponentPreview < ViewComponent::Preview
  # @display max_width 200px
  def default
    render CardComponent.new(title: "Example component default")
  end

  # @display max_width 400px
  def medium
    render CardComponent.new(title: "Example component default")
  end

  # @display max_width 600px
  def large
    render CardComponent.new(title: "Example component default")
  end
end
