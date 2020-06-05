class GuidesController < ApplicationController
  def index # Muestra recursos de una tabla
    if current_user
      @guides =
      if params[:category] && params[:category] != ""
        Category.find_by(id: params[:category]).guides
      else
        Guide.all
      end

      if params[:q]
        @guides = @guides.filter do |guide|
          guide.title.downcase.include?(params[:q].downcase)
        end
      end
    else
      redirect_to root_path
    end
  end

  def new
    if current_user
      @guide = Guide.new
    else
      redirect_to root_path
    end
  end

  def create
    @guide = Guide.new(secure_params)
    @guide.user = current_user
    if @guide.content.empty?
      flash[:warning] = "You can't publish an empty guide"
      render :new
    else
      if @guide.save
        redirect_to @guide
      else
        flash[:warning] = "There was a problem saving, please try again and check the fields"
        render :new
      end
    end
  end

  def edit
    if current_user
      @guide = Guide.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @guide = Guide.find(params[:id])

    if @guide.update(secure_params)
      redirect_to @guide
    else
      flash[:warning] = "There was a problem saving, please try again and check the fields"
      render "edit"
    end
  end

  def show
    if current_user
      @guide = Guide.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def destroy
    @guide = Guide.find(params[:id])
    @guide.destroy

    redirect_to guides_path
  end

  private

  def secure_params
    params.require(:guide).permit(:title, :description, :content, :category_id)
  end
end
