class SportsController < ApplicationController
  before_action :set_sport, only: %i[show edit update destroy]

  def index
    @sports = Sport.all
    @sport=Sport.new
  end

  def show
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      redirect_to sports_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @sport.update(sport_params)
    redirect_to sport_path(@sport)
  end

  def destroy
    @sport.destroy
    redirect_to sports_path
  end

  private

  def set_sport
    @sport = Sport.find(params[:id])
  end

  def sport_params
    params.require(:sport).permit(:name, :image)
  end
end
