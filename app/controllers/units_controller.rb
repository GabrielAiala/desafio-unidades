class UnitsController < ApplicationController
  def index
    weekday = Time.now.strftime('%A')
    weekdays = 'Seg. à Sex.'
    if weekday == 'Sunday'
      weekdays = 'Dom.'
    elsif weekday == 'Saturday'
      weekdays = 'Sáb.'
    end

    periods = search_params[:period]
    show_closed_units = search_params[:show_closed_units] == 'true' ? true : false

    @units = Unit.joins(:schedules).where(schedules: { weekdays: weekdays })
    @units = @units.where(schedules: { fechado: show_closed_units })

    if periods.present?
      if periods.include?('manha')
        @units = @units.where('schedules.fechamento > ?', 12)
      end
    
      if periods.include?('tarde')
        puts 'entrou aqui'
        @units = @units.where('schedules.abertura < ? AND schedules.fechamento > ?', 12, 18)
      end
    
      if periods.include?('noite')
        @units = @units.where('schedules.fechamento >= ?', 23)
      end
    end

    @count = @units.count

    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  private

  def search_params
    params.permit(:show_closed_units, period: ["manha", "tarde", "noite"])
  end
end
