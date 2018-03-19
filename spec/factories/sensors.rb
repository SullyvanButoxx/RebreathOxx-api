FactoryBot.define do
  factory :sensor do
    position { Faker::Number.between(1, 5) }
    serial_number { Faker::Code.ean }
    install_date { Faker::Date.backward(730) }
    rebreather_id { Faker::Number.between(1, 10) }
  end
end