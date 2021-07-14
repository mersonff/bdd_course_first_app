require "rails_helper"

RSpec.feature "Usuário se loga" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
  end
  scenario "with valid credentials" do
    visit "/"
    click_link "Log in"
    fill_in "Email", with: @john.email
    fill_in "Senha", with: @john.password
    click_button "Log in"
    expect(page).to have_content("Login efetuado com sucesso.")
    expect(page).to have_content("Logado como #{@john.email}")
    expect(page).not_to have_link("Log in")
    expect(page).not_to have_link("Registrar-se")
  end
end