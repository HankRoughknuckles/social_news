# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :email do |n| 
      "person#{n}@example.com" 
    end
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
end
