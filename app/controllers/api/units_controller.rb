class Api::UnitsController < ApiController
  def index
    @units = Unit.all
  end

  def create
    @unit = Unit.new(create_unit_params)

    if @unit.save
      schedule_params = create_unit_params[:schedules_attributes]

      schedule_params.each do |schedule|
        @unit.schedules.create(weekdays: schedule[:weekdays], hour: schedule[:hour])
      end

      render :create, status: :created
    else
      render json: @unit.errors.full_messages, status: 422
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
  end

  def update
    @unit = Unit.find(params[:id])

    if @unit.update(update_unit_params)
      schedule_params = update_unit_params[:schedules_attributes]

      schedule_params.each do |schedule|
        if schedule[:id]
          @unit.schedules.find(schedule[:id]).update(weekdays: schedule[:weekdays], hour: schedule[:hour])
        elsif schedule[:_destroy]
          @unit.schedules.find(schedule[:id]).destroy
        else
          @unit.schedules.create(weekdays: schedule[:weekdays], hour: schedule[:hour])
        end
      end
      render :update, status: :accepted
    else
      render json: @unit.errors.full_messages, status: 422
    end
  end
end

private

def create_unit_params
  params.require(:unit).permit(:id, :title, :content, :opened, :mask, :towel, :fountain, :locker_room, schedules_attributes: [ :weekdays, :hour])
end

def update_unit_params
  params.require(:unit).permit(:id, :title, :content, :opened, :mask, :towel, :fountain, :locker_room, schedules_attributes: [ :id, :weekdays, :hour, :_destroy])
end
