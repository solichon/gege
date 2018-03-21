class TimeslotsController < ApplicationController
  def index
    @timeslots = policy_scope(Timeslot)
    @is_xs = params["xs"]
    respond_to do |format|
      format.html
      format.json
    end
  end


  def show
    @timeslot = Timeslot.find(params[:id])
    authorize @timeslot
  end

  def new
    @timeslot = Timeslot.new
    authorize @timeslot
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.status = "empty"
    activity = Activity.find(timeslot_params[:activity_id])
    @timeslot.end_datetime = @timeslot.start_datetime + activity.duration_in_minutes * 60
    authorize @timeslot
    if @timeslot.save
      redirect_to timeslots_path
    else
      render :new
    end
  end

    private

  def timeslot_params
    params.require(:timeslot).permit(:start_datetime, :end_datetime, :activity_id)
  end
end
