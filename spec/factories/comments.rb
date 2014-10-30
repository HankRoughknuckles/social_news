FactoryGirl.define do
  factory :comment do
    title         "My thoughts"
    comment       "I think this could be something, but who knows?"
    user
  end
end
