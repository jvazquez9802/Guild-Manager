class UsersController < ApplicationController
  def index # Muestra recursos de una tabla
    if current_user
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
    render layout: "registration"
  end

  def create
    @user = User.new(secure_params)
    @user.gear_score = (((@user.atack + @user.atack_awake) / 2) + @user.denfense).floor
    @user.cover.attach(params[:user][:cover])

    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if current_user == User.find(params[:id]) || current_user.rank == "guild_master"
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.gear_score = (((@user.atack + @user.atack_awake) / 2) + @user.denfense).floor

    if params.dig(:user, :cover)
      @user.cover.attach(params[:user][:cover])
    end

    if params[:unblock]
      @user.update(blocked: false)
      redirect_to users_path
    elsif @user.update!(secure_params)
      redirect_to @user
    else
      render "edit"
    end
  end

  def show
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(blocked: true)

    redirect_to users_path
  end

  private

  def secure_params
    params.require(:user).permit(:family_name, :password, :discord_tag, :description, :atack, :atack_awake, :denfense, :gear_score, :branch, :avatar, :rank, :build_url, :cover)
  end
end
