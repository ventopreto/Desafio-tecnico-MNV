FactoryBot.define do
  factory :rental do
    start_date { Date.today }
    end_date { Date.today + 1 }
    association :book, factory: :book
    association :user, factory: :user

    trait :for_amor_de_perdicao do
      start_date { Date.today }
      end_date { Date.today + 3 }
      association :book, factory: [:book, :amor_de_perdicao]
      association :user, factory: [:user, :maria]
    end

    trait :for_os_maias do
      start_date { Date.today + 1 }
      end_date { Date.today + 4 }
      association :book, factory: [:book, :os_maias]
      association :user, factory: :user
    end

    trait :for_ensaio_sobre_a_cegueira do
      start_date { Date.today + 2 }
      end_date { Date.today + 5 }
      association :book, factory: [:book, :ensaio_sobre_a_cegueira]
      association :user, factory: [:user, :joao]
    end

    trait :extended_for_desassossego do
      start_date { Date.today + 3 }
      end_date { Date.today + 6 }
      association :book, factory: :book
      association :user, factory: [:user, :maria]
    end
  end
end