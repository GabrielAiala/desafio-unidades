class Api::UnitsController < ApiController
  def index
    @units = Unit.all
  end

  def create
    @unit = Unit.new(create_unit_params.except(:schedules_attributes))

    if @unit.save
      schedule_params = create_unit_params[:schedules_attributes]

      schedule_params.each do |schedule|
        fechado = false
        if schedule[:hour] == 'Fechado'
          fechado = true
        else
          abertura = schedule[:hour].split(' às ')[0].to_i
          fechamento = schedule[:hour].split(' às ')[1].to_i
        end
        @unit.schedules.create(weekdays: schedule[:weekdays], abertura: abertura, fechamento: fechamento, fechado: fechado)
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

    if @unit.update(update_unit_params.except(:schedules_attributes))
      schedule_params = update_unit_params[:schedules_attributes]

      schedule_params.each do |schedule|
        if schedule[:hour] == 'Fechado'
          fechado = true
        else
          abertura = schedule[:hour].split(' às ')[0].to_i
          fechamento = schedule[:hour].split(' às ')[1].to_i
        end

        if schedule[:id]
          @unit.schedules.find(schedule[:id]).update(weekdays: schedule[:weekdays], abertura: abertura, fechamento: fechamento, fechado: fechado)
        elsif schedule[:_destroy]
          @unit.schedules.find(schedule[:id]).destroy
        else
          @unit.schedules.create(weekdays: schedule[:weekdays], abertura: abertura, fechamento: fechamento, fechado: fechado)
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
