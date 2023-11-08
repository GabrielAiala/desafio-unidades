json.unit do
  json.title @unit.title
  json.content @unit.content
  json.opened @unit.opened
  json.mask @unit.mask
  json.towel @unit.towel
  json.fountain @unit.fountain
  json.locker_room @unit.locker_room
  json.schedules @unit.schedules do |schedule|
    json.weekdays schedule.weekdays
    if schedule.fechado
      json.hour 'Fechado'
    else 
      json.hour "#{schedule.abertura}h às #{schedule.fechamento}h"
    end
  end
end

