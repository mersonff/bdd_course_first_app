class RoutinesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_routine, only: [:show, :edit, :update, :destroy]
  def index
    @routines = Routine.all
  end

  def new
    @routine = Routine.new
  end

  def edit
    unless @routine.user == current_user
      flash[:alert] = t "helpers.messages.owner_restriction"
      redirect_to root_path
    end
  end

  def show
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.user = current_user
    if @routine.save
      flash[:success] = "Treino criado com sucesso"
      redirect_to routines_path
    else
      flash.now[:alert] = "Não foi possível criar o treino"
      render :new
    end
  end

  def update
    unless @routine.user == current_user
      flash[:alert] = t "helpers.messages.owner_restriction"
      redirect_to root_path
    else
      if @routine.update(routine_params)
        flash[:success] = "Treino atualizado com sucesso"
        redirect_to @routine
      else
        flash.now[:alert] = "Treino não foi atualizado"
        render :edit
      end
    end
  end

  def destroy
    unless @routine.user == current_user
      flash[:alert] = t "helpers.messages.owner_restriction"
      redirect_to root_path
    else
      if @routine.destroy
        flash[:success] = "Treino deletado com sucesso"
        redirect_to routines_path
      end
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:name, :description, :user_id)
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