FactoryGirl.define do
  factory :list do
    title "Errands"
    created_at Time.now
  end

  factory :todo do
    todo_item "Go grocery shopping"
    association :list, factory: :list
  end
end
