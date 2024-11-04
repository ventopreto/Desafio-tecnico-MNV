FactoryBot.define do
  factory :author do
    name { "Fernando Pessoa" }
    biography { "Um dos maiores poetas da língua portuguesa." }

    trait :with_book do
      after(:create) do |author|
        create(:book, author: author)
      end
    end

    trait :camilo do
      name { "Camilo Castelo Branco" }
      biography { "Um dos maiores romancistas do romantismo português." }
    end

    trait :eca do
      name { "Eça de Queirós" }
      biography { "Considerado um dos melhores escritores realistas de Portugal." }
    end

    trait :saramago do
      name { "José Saramago" }
      biography { "Escritor português, ganhador do Prêmio Nobel de Literatura." }
    end
  end
end
