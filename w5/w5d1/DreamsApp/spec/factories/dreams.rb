FactoryGirl.define do
  factory :dream do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph(50) }
    completeness { rand(101) }
    spooky false
    user_id 1

    factory :spooky_dream do
      spooky true
    end
  end
end
