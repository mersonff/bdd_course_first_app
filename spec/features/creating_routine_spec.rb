require 'rails_helper'

RSpec.feature "Criando Treinos", type: feature do
  scenario "Um usuário cria um novo treino" do
    visit "/"

    click_link "Novo Treino"

    fill_in "Nome", with: "Treino A"
    fill_in "Descrição", with:"Supino: 3x10
                               Agachamento: 3x15"
    click_button "Salvar"
    expect(page).to have_content("Treino criado com sucesso")
    puts page.current_path
    expect(page.current_path).to eq(routines_path)
  end
end