require 'rails_helper'

RSpec.feature 'Adicionando Comentários aos Treinos' do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @jane = User.create(email: "jane@example.com", password: "password")

    @routine = Routine.create(name: 'Treino A', description: 'Supino 3x10', user: @john)
  end

  scenario 'permite um usuário logado a escrever um comentário' do
    login_as(@jane)
    visit "/"
    click_link @routine.name
    fill_in "Novo comentário", with: "Treino bacana"
    click_button "Comentar"
    expect(page).to have_content("Comentário enviado")
    expect(page).to have_content("Treino bacana")
    expect(current_path).to eq(routine_path(@routine))
  end
end