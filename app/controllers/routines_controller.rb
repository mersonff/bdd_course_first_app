class RoutinesController < ApplicationController
  def index

  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.save
    flash[:success] = "Treino criado com sucesso"
    redirect_to routines_path
  end

  private

  def routine_params
    params.require(:routine).permit(:name, :description)
  end
end