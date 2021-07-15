require 'rails_helper'

RSpec.feature 'Exibindo Treinos', type: feature do

  before do
    @john = User.create(email: "john@example.com", password: "password")
    @jane = User.create(email: "jane@example.com", password: "password")


    @routine = Routine.create(name: 'Treino A', description: 'Supino 3x10', user: @john)
  end

  scenario "um usuário não logado não pode ver os links de Editar e Deletar" do
    visit "/"
    click_link @routine.name
    expect(page).to have_content(@routine.name)
    expect(page).to have_content(@routine.description)
    expect(current_path).to eq(routine_path(@routine))
    expect(page).not_to have_link("Editar")
    expect(page).not_to have_link("Deletar")
  end

  scenario "um usuário logado mas que não criou os treinos não pode ver os links" do
    login_as(@jane)
    visit "/"
    click_link @routine.name
    expect(page).not_to have_link("Editar")
    expect(page).not_to have_link("Deletar")
  end

  scenario 'Um usuário exibe um treino' do
    visit '/'
    click_link @routine.name

    expect(page).to have_content(@routine.name)
    expect(page).to have_content(@routine.description)
    expect(page.current_path).to eq(routine_path(@routine))
  end

end