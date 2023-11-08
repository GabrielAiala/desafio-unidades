FactoryBot.define do
  factory :schedule do
    weekdays { Faker::Lorem.word }
    abertura { 9 }
    fechamento { 23 }
    unit
  end
end