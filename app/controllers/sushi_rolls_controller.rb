class SushiRollsController < ApplicationController
  before_action :set_sushi_roll, only: [:show, :edit, :update, :destroy]

  def index
    @sushi_rolls = current_user.sushi_rolls
  end

  def show
  end

  def new
    @sushi_roll = current_user.sushi_rolls.new
  end

  def edit
  end

  def create
    @sushi_roll = current_user.sushi_rolls.new(roll_params)
    if @sushi_roll.save
      redirect_to @sushi_roll, notice: 'Roll Created'
    else
      render :new
    end
  end

  def update
    if @sushi_roll.update(roll_params)
      redirect_to @sushi_roll, notice: 'Roll updated'
    else
      render :edit
    end
  end

  def destroy
    @sushi_roll.destroy
    redirect_to sushi_rolls_url, notice: 'Roll destroyed'
  end

  private
    def set_sushi_roll
      @sushi_roll = current_user.sushi_rolls.find(params[:id])
    end

    def roll_params
      params.require(:sushi_roll).permit(
        :name,
        :price,
        :roll_count,
        :spicy,
        :fish,
        :wrap,
        :description
        )
    end

end
