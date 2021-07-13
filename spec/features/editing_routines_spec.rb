require 'rails_helper'

RSpec.feature 'Editando Treinos' do
  before do
    @routine = Routine.create(name: "Treino A", description: "Supino 3x10")
  end

  scenario 'Um usuário atualiza um treino' do
    visit "/"
    click_link @routine.name
    click_link "Editar Treino"
    fill_in "Nome", with: "Treino Atualizado"
    fill_in "Descrição", with: "Supino 4x10"
    click_button "Atualizar Treino"
    expect(page).to have_content("Treino atualizado com sucesso")
    expect(page.current_path).to eq(routine_path(@routine))
  end

  scenario 'Um usuário falha ao atualizar um treino' do
    visit "/"
    click_link @routine.name
    click_link "Editar Treino"
    fill_in "Nome", with: ""
    fill_in "Descrição", with: "Supino 4x10"
    click_button "Atualizar Treino"
    expect(page).to have_content("Treino não foi atualizado")
    expect(page.current_path).to eq(routine_path(@routine))
  end
end