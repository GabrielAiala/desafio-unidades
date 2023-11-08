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
        "abertura": 6,
        "fechamento": 23,
        "fechado": false
      },
      {
        "weekdays": "Sáb.",
        "abertura": 6,
        "fechamento": 23,
        "fechado": false
      },
      {
        "weekdays": "Dom.",
        "abertura": 6,
        "fechamento": 23,
        "fechado": false
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
        "abertura": 6,
        "fechamento": 23,
        "fechado": false
      },
      {
        "weekdays": "Sáb.",
        "abertura": 6,
        "fechamento": 23,
        "fechado": false
      },
      {
        "weekdays": "Dom.",
        "abertura": 6,
        "fechamento": 23,
        "fechado": false
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
        "abertura": 6,
        "fechamento": 23,
        "fechado": false
      },
      {
        "weekdays": "Sáb.",
        "abertura": 6,
        "fechamento": 23,
        "fechado": false
      },
      {
        "weekdays": "Dom.",
        "abertura": 6,
        "fechamento": 23,
        "fechado": false
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
      abertura: schedule_data[:abertura],
      fechamento: schedule_data[:fechamento],
      fechado: schedule_data[:fechado]
    )
  end
end
