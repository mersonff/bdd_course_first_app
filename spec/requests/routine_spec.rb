RSpec.describe "Treinos", type: :request do
  before do
    @routine = Routine.create(name: "Treino A", description: "Supino Reto 3x10")
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
end