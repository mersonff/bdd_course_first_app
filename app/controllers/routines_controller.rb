class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy]
  def index
    @routines = Routine.all
  end

  def new
    @routine = Routine.new
  end

  def edit
  end

  def show
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
    if @routine.update(routine_params)
      flash[:success] = "Treino atualizado com sucesso"
      redirect_to @routine
    else
      flash.now[:danger] = "Treino não foi atualizado"
      render :edit
    end
  end

  def destroy
    if @routine.destroy
      flash[:success] = "Treino deletado com sucesso"
      redirect_to routines_path
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:name, :description)
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end

  protected

  def resource_not_found
    message = "O treino não foi encontrado"
    flash[:warning] = message
    redirect_to root_path
  end
end