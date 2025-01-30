require "application_system_test_case"

class LeadSytemTest < ApplicationSystemTestCase
  test "change lead status" do
    sign_in users(:charles)
    visit lead_path(contacts(:lead))
    within "section#lead_status" do
      accept_alert do
        click_on "Nutrição"
      end
      assert_no_selector "a", text: "Nutrição"
      assert_selector "a", text: "Trabalhando"
      accept_alert do
        click_on "Trabalhando"
      end
      assert_no_selector "a", text: "Trabalhando"
      assert_selector "a", text: "Qualificação"
      accept_alert do
        click_on "Qualificação"
      end
      assert_no_selector "a", text: "Qualificação"
      assert_selector "a", text: "Descartado"
      assert_selector "a", text: "Convertido"
    end
  end
end
