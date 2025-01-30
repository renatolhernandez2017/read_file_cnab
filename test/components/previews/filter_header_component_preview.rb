# frozen_string_literal: true

class FilterHeaderComponentPreview < ViewComponent::Preview
  def default
    render FilterHeaderComponent.new(title: "Filtro", icon: "drag_handle")
  end

  def leads
    render FilterHeaderComponent.new(title: "leads", icon: "favorite")
  end

  def new_oportunities
    render FilterHeaderComponent.new(title: "Criar Oportunidades", icon: "diamond")
  end
end
