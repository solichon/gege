class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    @activity.status = :active
    authorize @activity
    if @activity.save
      redirect_to activities_path
    else
      render :new
    end
  end


  def show
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def index
    @activities = policy_scope(Activity)
  end

  def edit
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def update
    @activity = Activity.find(params[:id])
    authorize @activity
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def activity_params
    params.require(:activity).permit(:title, :description, :capacity, :duration_in_minutes, :meeting_point, :adult_price_cents, :child_price_cents, :image, :image_cache)
  end
end
