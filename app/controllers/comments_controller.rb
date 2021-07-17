class CommentsController < ApplicationController
  before_action :set_routine

  def create
    @comment = @routine.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      ActionCable.server.broadcast "comments",
                                   render(partial: 'comments/comment', object: @comment )
      flash[:notice] = "Comentário enviado"
    else
      flash[:alert] = "Comentário não enviado"
      redirect_to routine_path(@routine)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_routine
    @routine = Routine.find(params[:routine_id])
  end
end
