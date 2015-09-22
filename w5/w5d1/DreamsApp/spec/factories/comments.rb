FactoryGirl.define do
  factory :comment do
    body "MyText"
    author_id 1
    commentable_type "MyString"
    commentable_id 1
    spooky false
  end
end
