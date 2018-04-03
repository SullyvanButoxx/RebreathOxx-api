FactoryBot.define do
    factory :user do
      firstname { Faker::Name.first_name  }
      lastname { Faker::Name.last_name }
      login { Faker::DragonBall.character }
      email 'foo@bar.com'
      password 'foobar'
    end
  end