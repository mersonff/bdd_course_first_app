require 'rails_helper'

RSpec.feature 'Exibindo Treinos', type: feature do

  before do
    john = User.create(email: "john@example.com", password: "password")
    login_as(john)

    @routine = Routine.create(name: 'Treino A', description: 'Supino 3x10', user: john)
  end

  scenario 'Um usuário exibe um treino' do
    visit '/'
    click_link @routine.name

    expect(page).to have_content(@routine.name)
    expect(page).to have_content(@routine.description)
    expect(page.current_path).to eq(routine_path(@routine))
  end

end