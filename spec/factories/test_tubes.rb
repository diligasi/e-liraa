FactoryBot.define do
  factory :test_tube do
    code { "MyString" }
    shed_type { nil }
    collected_amount { 1 }
    comments { "MyText" }
    field_form { nil }
  end
end
