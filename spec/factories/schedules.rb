FactoryBot.define do
  factory :schedule do
    weekdays { Faker::Lorem.word }
    hour { Faker::Lorem.word }
    unit
  end
end