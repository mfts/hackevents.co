FactoryGirl.define do  

  factory :membership do
    user_id 1
    hackathon_id 1
  end


  factory :user do
    first_name "First"
    last_name "Last"
    twitter_name "Twitter"
    sequence(:email) { |n| "user#{n}@hackbook.com" }
    password "hackbook1"
    password_confirmation "hackbook1"
  end

end