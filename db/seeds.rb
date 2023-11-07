# db/seeds.rb

locations_data = [
  {
    "title": "Academia Fictícia 1",
    "content": "\n<p>Rua da Imaginação, 123<br>Cidade dos Sonhos, SF</p>\n",
    "opened": [true, false].sample,
    "mask": ["required", "not_required"].sample,
    "towel": ["required", "not_required"].sample,
    "fountain": ["partial", "not_allowed"].sample,
    "locker_room": ["allowed", "closed"].sample,
    "schedules": [
      {
        "weekdays": "Seg. à Sex.",
        "hour": "06h às 22h"
      },
      {
        "weekdays": "Sáb.",
        "hour": ["Fechada", "08h às 18h"].sample
      },
      {
        "weekdays": "Dom.",
        "hour": ["Fechada", "09h às 17h"].sample
      }
    ]
  },
  {
    "title": "Clube Fictício",
    "content": "\n<p>Avenida da Imaginação, 456<br>Cidade dos Sonhos, SF</p>\n",
    "opened": [true, false].sample,
    "mask": ["required", "not_required"].sample,
    "towel": ["required", "not_required"].sample,
    "fountain": ["partial", "not_allowed"].sample,
    "locker_room": ["allowed", "not_allowed"].sample,
    "schedules": [
      {
        "weekdays": "Seg. à Sex.",
        "hour": "07h às 23h"
      },
      {
        "weekdays": "Sáb.",
        "hour": ["Fechada", "09h às 19h"].sample
      },
      {
        "weekdays": "Dom.",
        "hour": ["Fechada", "10h às 18h"].sample
      }
    ]
  },
  {
    "title": "Ginásio Fictício",
    "content": "\n<p>Rua da Imaginação, 789<br>Cidade dos Sonhos, SF</p>\n",
    "opened": [true, false].sample,
    "mask": ["required", "not_required"].sample,
    "towel": ["required", "not_required"].sample,
    "fountain": ["partial", "not_allowed"].sample,
    "locker_room": ["allowed", "closed"].sample,
    "schedules": [
      {
        "weekdays": "Seg. à Sex.",
        "hour": "08h às 20h"
      },
      {
        "weekdays": "Sáb.",
        "hour": ["Fechada", "10h às 16h"].sample
      },
      {
        "weekdays": "Dom.",
        "hour": ["Fechada", "11h às 15h"].sample
      }
    ]
  }
]

locations_data.each do |unit_data|
  Unit.create(
    title: unit_data[:title],
    content: unit_data[:content],
    opened: unit_data[:opened],
    mask: unit_data[:mask],
    towel: unit_data[:towel],
    fountain: unit_data[:fountain],
    locker_room: unit_data[:locker_room]
  )

  unit_data[:schedules].each do |schedule_data|
    Schedule.create(
      unit: Unit.last,
      weekdays: schedule_data[:weekdays],
      hour: schedule_data[:hour]
    )
  end
end
