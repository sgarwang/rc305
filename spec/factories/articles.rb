# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    name "MyString"
    content "MyText"
    aurthor_name "MyString"
    user_id 1
  end
end
