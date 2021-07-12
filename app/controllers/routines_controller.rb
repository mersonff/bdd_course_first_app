class RoutinesController < ApplicationController
  def index
    @routines = Routine.all
  end

  def new
    @routine = Routine.new
  end

  def edit
    @routine = Routine.find(params[:id])
  end

  def show
    @routine = Routine.find(params[:id])
  end

  def create
    @routine = Routine.new(routine_params)
    if @routine.save
      flash[:success] = "Treino criado com sucesso"
      redirect_to routines_path
    else
      flash.now[:danger] = "Não foi possível criar o treino"
      render :new
    end
  end

  def update
    @routine = Routine.find(params[:id])
    if @routine.update(routine_params)
      flash[:success] = "Treino atualizado com sucesso"
      redirect_to @routine
    else
      flash.now[:danger] = "Treino não foi atualizado"
      render :edit
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:name, :description)
  end

  protected

  def resource_not_found
    message = "O treino não foi encontrado"
    flash[:warning] = message
    redirect_to root_path
  end
end