require "application_system_test_case"

class AuthenticationsTest < ApplicationSystemTestCase
  test "login user" do
    visit user_session_path
    fill_in "E-Mail", with: "charles@dsop.com.br"
    fill_in "Senha", with: "123123"

    click_on "Confirmar"

    assert_current_path root_path
    assert_text "Conectado com sucesso"
  end

  test "failure login" do
    visit user_session_path
    fill_in "E-Mail", with: "charles@dsop.com.br"
    fill_in "Senha", with: "incorret"

    click_on "Confirmar"

    assert_current_path user_session_path
    assert_text "Email ou senha inválida"
  end
end
