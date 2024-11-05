# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "Usuario Genérico" }
    email { "usuario@example.com" }

    trait :with_rental do
      after(:create) do |user|
        create(:rental, user:)
      end
    end

    trait :maria do
      name { "Maria da Silva" }
      email { "maria.silva@example.com" }
    end

    trait :joao do
      name { "João Pereira" }
      email { "joao.pereira@example.com" }
    end
  end
end
