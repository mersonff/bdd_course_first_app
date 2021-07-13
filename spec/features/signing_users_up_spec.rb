require "rails_helper"

RSpec.feature "Usuário se registra" do
  scenario "com credenciais válidas" do
    visit "/"
    click_link "Registrar-se"
    fill_in "Email", with: "usuario@exemplo.com"
    fill_in "Senha", with: "password"
    fill_in "Confirmar senha", with: "password"
    click_button "Registrar-se"
    expect(page).to have_content("Registro realizado com sucesso.")
  end

  scenario "com credenciais inválidas" do
    visit "/"
    click_link "Registrar-se"
    fill_in "Email", with: ""
    fill_in "Senha", with: ""
    fill_in "Confirmar senha", with: ""
    click_button "Registrar-se"
    #expect(page).to have_content("You have not signed up successfully.")
  end
end
