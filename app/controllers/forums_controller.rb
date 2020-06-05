class ForumsController < ApplicationController
  def index # Muestra recursos de una tabla
    if current_user
      @forums =
        if params[:category] && !params[:category].empty?
            Category.find_by(id: params[:category]).forums
        else
          Forum.all
        end

      if params[:q]
        @forums = @forums.filter do |forum|
          forum.title.downcase.include?(params[:q].downcase)
        end
      end
    else
      redirect_to root_path
    end
  end

  def new
    if current_user
      @forum = Forum.new
    else
      redirect_to root_path
    end
  end

  def create
    @forum = Forum.new(secure_params)
    @forum.user = current_user

    if @forum.content.empty?
        flash[:warning] = "You can't publish an empty forum"
        render :new
    else
      if @forum.save
        redirect_to @forum
      else
        flash[:warning] = "There was a problem saving, please try again and check the fields"
        render :new
      end
    end
  end

  def edit
    if current_user
      @forum = Forum.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @forum = Forum.find(params[:id])
    if params["change"] == "true"
      if @forum.solved
        @forum.solved = false
        @forum.save
        redirect_to @forum
      else
        @forum.solved = true
        @forum.save
        redirect_to @forum
      end
    else
      if @forum.update(secure_params)
        redirect_to @forum
      else
        render "edit"
      end
    end
  end

  def show
    if current_user
      @forum = Forum.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy

    redirect_to forums_path
  end

  private

  def secure_params
    params.require(:forum).permit(:title, :reason, :content, :category_id)
  end
end
