# frozen_string_literal: true

require "test_helper"

class FilterHeaderComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    assert_equal(
      %(<span class="material-symbols-outlined justify-center text-dsop-dark-blue font-semibold">favorite</span>),
      render_inline(FilterHeaderComponent.new(title: "leads", icon: "favorite")).css("span").to_html
    )
  end
end
