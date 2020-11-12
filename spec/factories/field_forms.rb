FactoryBot.define do
  factory :field_form do
    user { nil }
    status { 1 }
    street { "MyString" }
    number { "MyString" }
    complement { "MyString" }
    district { "MyString" }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    zipcode { "MyString" }
    property_type { nil }
    visit_status { 1 }
    visit_comment { "MyText" }
    larvae_found { false }
    larvicide { "" }
    rodenticide { false }
  end
end
