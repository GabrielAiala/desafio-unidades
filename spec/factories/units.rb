FactoryBot.define do
  factory :unit do
      title { Faker::Lorem.word }
      content { Faker::Lorem.paragraph }
      opened { Faker::Boolean.boolean }
      mask { "recommended" }
      towel { "recommended" }
      fountain { "allowed" }
      locker_room { "allowed" }
  end
end