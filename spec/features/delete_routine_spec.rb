require 'rails_helper'

RSpec.feature 'Deletando Trienos', type: feature do
  before do
    @routine = Routine.create(name: 'Treino A', description: 'Supino Reto 3x10')
  end

  scenario 'Um usuário deleta um treino' do
    visit '/'
    click_link @routine.name
    click_link "Deletar"
    expect(page).to have_content("Treino deletado com sucesso")
    expect(current_path).to eq(routines_path)
  end
end