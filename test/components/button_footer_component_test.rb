# frozen_string_literal: true

require "test_helper"

class ButtonFooterComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    assert_equal(
      %(),
      render_inline(ButtonFooterComponent.new).css("span").to_html
    )
  end
end
