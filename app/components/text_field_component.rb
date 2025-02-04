# frozen_string_literal: true

class TextFieldComponent < ViewComponent::Base
  TRANSACTION_KINDS = {
    1 => "Debito",
    2 => "Boleto",
    3 => "Financiamento",
    4 => "Crédito",
    5 => "Recebimento Empréstimo",
    6 => "Vendas",
    7 => "Recebimento TED",
    8 => "Recebimento DOC",
    9 => "Aluguel"
  }.freeze

  def initialize(transaction:)
    @transaction = transform_transaction(transaction.attributes)
  end

  private

  def transform_transaction(attributes)
    attributes.transform_values.with_index do |value, index|
      field_name = attributes.keys[index]
      transform_value(field_name, value)
    end
  end

  def transform_value(field_name, value)
    case field_name
    when "kind"
      TRANSACTION_KINDS[value.to_i] || "Desconhecido"
    when "date_ocurrence"
      value.strftime("%d/%m/%Y")
    when "time_ocurrence"
      value.strftime("%H:%M:%S")
    when "price"
      number_to_currency(value)
    when "cpf"
      format_cpf(value)
    else
      value
    end
  end

  def format_cpf(cpf)
    cpf.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4')
  end
end
