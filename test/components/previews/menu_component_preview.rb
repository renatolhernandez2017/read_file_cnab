# frozen_string_literal: true

class MenuComponentPreview < ViewComponent::Preview
  ITEMS = [
    {title: "Item 1", path: "https://google.com.br", icon: "home"},
    {title: "Item 2", path: nil, icon: "favorite"},
    {title: "Item 3", path: nil, icon: "domain"},
    {title: "Item 4", path: nil, icon: "person"},
    {title: "Item 5", path: nil, icon: "diamond"},
    {title: "", path: nil, icon: "edit"}
  ]

  def default
    render MenuComponent.new(items: ITEMS, active: "Item 1")
  end
end
