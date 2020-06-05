class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  def create
    @comment = Comment.new(secure_params)
    @comment.user = current_user
    if @comment.content.empty?
      flash[:warning] = "You can't publish an empty comment"
    else
      @comment.save
    end
    redirect_path
  end

  def edit
  end

  def update
    if params["like"] == "true"
      @comment.likes << current_user.id unless @comment.likes.include?(current_user.id)
      if @comment.dislikes.include?(current_user.id)
        @comment.dislikes.delete(current_user.id)
      end
      @comment.save
      redirect_path
    
    elsif  params["dislike"] == "true"
      @comment.dislikes << current_user.id unless @comment.dislikes.include?(current_user.id)
      if @comment.likes.include?(current_user.id)
        @comment.likes.delete(current_user.id)
      end
      @comment.save
      redirect_path
    else
      if @comment.update(secure_params)
        flash[:success] = "Comment updated correctly"
      else
        flash[:warning] = "An error has ocurred"
      end

      redirect_path
    end
  end

  def destroy
    if @comment.delete
      flash[:info] = "Comment deleted correctly"
    else
      flash[:warning] = "An error has ocurred"
    end

    redirect_path
  end

  private

  def secure_params
    params.require(:comment).permit(:content, :guide_id, :forum_id)
  end

  def redirect_path
    if @comment.guide
      redirect_to @comment.guide
    else
      redirect_to @comment.forum
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
