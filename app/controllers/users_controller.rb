class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events
    @user_sports = UserSport.where(user: @user)
    @past_events = @user.events.where('date < ?', Date.today)
    @joined_events = @user.events.where('date >= ?', Date.today)
    authorize @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.except(:levels))
    if @user.save
      params[:levels].each do |sport_id, level|
        UserSport.create(user: @user, sport_id: sport_id, level: level)
      end
      redirect_to user_path(@user), notice: "User was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])

    if @user.update(user_params.except(:levels))
      params[:levels].each do |sport_id, level|
        user_sport = UserSport.find_by(user: @user, sport_id: sport_id)

        if user_sport
          user_sport.update(level: level)
        else
          UserSport.create(user: @user, sport_id: sport_id, level: level)
        end
      end

      @user.user_sports.where.not(sport_id: params[:levels].keys).destroy_all

      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, status: :see_other
  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :birth_date, :gender, :about, :location, :photo, sport_ids: [], levels: [])
  end
end
