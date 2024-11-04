FactoryBot.define do
  factory :book do
    title { "Desassossego" }
    synopsis { "Um livro de Fernando Pessoa" }
    published_at { Date.new(1933) }
    association :author, factory: :author

    trait :amor_de_perdicao do
      title { "Amor de Perdição" }
      synopsis { "Um dos maiores clássicos do romantismo português." }
      published_at { Date.new(1862) }
      association :author, factory: [:author, :camilo]
    end

    trait :os_maias do
      title { "Os Maias" }
      synopsis { "Uma obra-prima da literatura portuguesa sobre o desencanto da vida aristocrática." }
      published_at { Date.new(1888) }
      association :author, factory: [:author, :eca]
    end

    trait :ensaio_sobre_a_cegueira do
      title { "Ensaio sobre a cegueira" }
      synopsis { "Um romance distópico sobre uma epidemia de cegueira." }
      published_at { Date.new(1995) }
      association :author, factory: [:author, :saramago]
    end
  end
end