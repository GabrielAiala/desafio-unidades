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
    json.hour schedule.hour
  end
end
