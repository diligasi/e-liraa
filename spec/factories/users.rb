FactoryBot.define do
  factory :user, class: 'User' do
    name     { Faker::Name.name }
    cpf      { Faker::CPF.numeric }
    email    { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }

    trait :active do
      status { true }
    end

    trait :inactive do
      status { false }
    end

    trait :admin do
      role { 'admin' }
    end

    trait :supervisor do
      role { 'supervisor' }
    end

    trait :lab do
      role { 'lab' }
    end

    trait :field do
      role { 'field' }
    end
  end
end
