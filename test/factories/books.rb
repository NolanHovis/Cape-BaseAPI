FactoryBot.define do
  factory :book do
    author { "MyString" }
    genre { "MyString" }
    title { "MyString" }
    coverImagePath { "MyString" }
    user { nil }
  end
end
