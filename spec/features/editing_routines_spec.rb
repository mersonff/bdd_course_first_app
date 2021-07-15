require 'rails_helper'

RSpec.feature 'Editando Treinos' do
  before do
    john = User.create(email: "john@example.com", password: "password")
    login_as(john)
    @routine = Routine.create(name: "Treino A", description: "Supino 3x10", user: john)
  end

  scenario 'Um usuário atualiza um treino' do
    visit "/"
    click_link @routine.name
    click_link "Editar"
    fill_in "Nome", with: "Treino Atualizado"
    fill_in "Descrição", with: "Supino 4x10"
    click_button "Atualizar"
    expect(page).to have_content("Treino atualizado com sucesso")
    expect(page.current_path).to eq(routine_path(@routine))
  end

  scenario 'Um usuário falha ao atualizar um treino' do
    visit "/"
    click_link @routine.name
    click_link "Editar"
    fill_in "Nome", with: ""
    fill_in "Descrição", with: "Supino 4x10"
    click_button "Atualizar"
    expect(page).to have_content("Treino não foi atualizado")
    expect(page.current_path).to eq(routine_path(@routine))
  end
end