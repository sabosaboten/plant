class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  
  def new
    @schedule = Schedule.new
  end

  def create
    Schedule.create(schedule_params)
    redirect_to schedules_path
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    schedule = Schedule.find(params[:id])
    schedule.update(schedule_params)
    redirect_to schedules_path
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to schedules_path
  end
    

  private
  def schedule_params
    params.require(:schedule).permit(:image, :plantname, :frecuency, :date, :time).merge(user_id: current_user.id)
  end

end

