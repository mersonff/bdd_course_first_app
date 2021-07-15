RSpec.describe "Treinos", type: :request do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    @fred = User.create!(email: "fred@example.com", password: "password")
    @routine = Routine.create!(name: "Treino A", description: "Supino Reto 3x10", user: @john)
  end

  describe 'GET /routines/:id' do
    context 'com um treino existente' do
      before { get "/routines/#{@routine.id}" }
      it "trata treinos existentes" do
        expect(response.status).to eq 200
      end
    end
    context 'com um treino não existente' do
      before { get "/routines/xxxxx" }
      it "trata treinos não existentes" do
        expect(response.status).to eq 302
        flash_message = "O treino não foi encontrado"
        expect(flash[:warning]).to eq flash_message
      end
    end
  end
  describe 'GET /routines/:id/edit' do
    context 'com um usuário não logado' do
      before { get "/routines/#{@routine.id}/edit" }
      it "redireciona para a página de log in" do
        expect(response.status).to eq 302
        flash_message = "Para continuar, faça login ou registre-se."
        expect(flash[:alert]).to eq flash_message
      end
    end

    context 'com um usuário logado mas que não é dono' do
      before do
        login_as(@fred)
        get "/routines/#{@routine.id}/edit"
      end
      it "redireciona para página inicial" do
        expect(response.status).to eq 302
        flash_message = "Você só pode editar ou deletar seus próprios treinos."
        expect(flash[:alert]).to eq flash_message
      end
    end

    context 'com um usuário logado que é dono' do
      before do
        login_as(@john)
        get "/routines/#{@routine.id}/edit"
      end
      it "edita o treino com sucesso" do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'DELETE /routines/:id' do
    context 'com um usuário não logado' do
      before { delete "/routines/#{@routine.id}" }
      it "redireciona para a página de log in" do
        expect(response.status).to eq 302
        flash_message = "Para continuar, faça login ou registre-se."
        expect(flash[:alert]).to eq flash_message
      end
    end

    context 'com um usuário não logado mas que não é dono' do
      before do
        login_as(@fred)
        delete "/routines/#{@routine.id}"
      end
      it "redireciona para página inicial" do
        expect(response.status).to eq 302
        flash_message = "Você só pode editar ou deletar seus próprios treinos."
        expect(flash[:alert]).to eq flash_message
      end
    end

    context 'com um usuário logado que é dono' do
      before do
        login_as(@john)
        delete "/routines/#{@routine.id}"
      end
      it "deleta o treino com sucesso" do
        expect(response.status).to eq 302
      end
    end
  end

end