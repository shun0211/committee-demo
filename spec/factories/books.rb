FactoryBot.define do
  factory :book do
    title { "ハリーポッターと賢者の石" }
    association :publisher
    # association :authors #エラー

    after(:create) do |book|
      create_list(:author, 3, books: [book])
    end

    # つくりたいときだけつくる
    trait :with_books do
      after(:create) do |book|
        create_list(:author, 3, books: [book])
      end
    end

  end
end
