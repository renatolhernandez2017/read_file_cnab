# frozen_string_literal: true

class FieldComponentPreview < ViewComponent::Preview
  # @display max_width 500px
  def default
    render FieldComponent.new(label: "Nome", field_name: "Teste de campo")
  end
end
