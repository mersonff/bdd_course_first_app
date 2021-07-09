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
    expect(page.current_path).to eq(routines_path)
  end

  scenario "Um usuário falha ao tentar criar um novo treino" do
    visit "/"

    click_link "Novo Treino"

    fill_in "Nome", with: ""
    fill_in "Descrição", with:""
    click_button "Salvar"
    expect(page).to have_content("Não foi possível criar o treino")
    expect(page).to have_content("Nome não pode estar em branco")
    expect(page).to have_content("Descrição não pode estar em branco")
  end
end