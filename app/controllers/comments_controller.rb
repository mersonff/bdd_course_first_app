class CommentsController < ApplicationController
  before_action :set_routine

  def create
    @comment = @routine.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comentário enviado"
    else
      flash[:alert] = "Comentário não enviado"
    end
    redirect_to routine_path(@routine)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_routine
    @routine = Routine.find(params[:routine_id])
  end
end
