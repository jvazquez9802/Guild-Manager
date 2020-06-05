class ActivitiesController < ApplicationController
  before_action :user_is_logged?
  before_action :user_is_admin?, only: [:new, :create, :edit, :destroy]

  def index # Muestra recursos de una tabla
    if current_user
      @activity_groups = Activity.where("start_time >= ?", Date.today).group_by { |a| [a.start_time.year, a.start_time.month, a.start_time.day] }
    else
      redirect_to root_path
    end
  end

  def new
    if current_user
      @activity = Activity.new
    else
      redirect_to root_path
    end
  end

  def create
    @activity = Activity.new(secure_params)
    @activity.avatar.attach(params[:activity][:avatar])
    @activity.user = current_user

    if @activity.avatar.attached?
      if @activity.save
        redirect_to @activity
      else
        render :new
      end
    else
      flash[:warning] = "You have to upload an image"
      render :new
    end
  end

  def edit
    if current_user
      @activity = Activity.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @activity = Activity.find(params[:id])

    if params["participate"] == "true"
      @activity.participants << current_user.id unless @activity.participants.include?(current_user.id)
      @activity.save

      redirect_to @activity
    else
      if @activity.avatar.attached?
        if @activity.update(secure_params)
          redirect_to @activity
        else
          render "edit"
        end
      else 
        flash[:warning] = "You have to upload an image"
        render "edit"
      end
    end

  end

  def show
    if current_user
      @activity = Activity.with_attached_avatar.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    flash[:success] = "Deleted correctly"
    redirect_to activities_path
  end

  private

  def secure_params
    params.require(:activity).permit(:title, :description, :location, :start_time, :content, :avatar, :channel, :category)
  end

  def user_is_admin?
    unless current_user.is_admin?
      flash[:danger] = "Necesitas tener el rango Guild Master o Oficial para hacer esta acción"
      redirect_to activities_path
    end
  end
end
