FactoryGirl.define do  factory :create_event do
    
  end
  factory :organization do
    organizer_id 1
organized_hackathon_id 1
  end
  factory :city do
    name "MyString"
hackathon_count 1
hackathon_total_count 1
image_url "MyString"
  end
  factory :affiliation do
    
  end
  factory :interest do
    
  end
  factory :relationship do
    follower_id 1
followed_id 1
  end
  factory :sponsorship do
    sponsor_id 1
hackathon_id 1
  end
  factory :sponsor do
    twitter_handle "MyString"
twitter_image_url "MyString"
twitter_name "MyString"
alt_name "MyString"
  end
  factory :categorization do
    category_id 1
hackathon_id 1
  end
  
  
  factory :identity do
    user nil
provider "MyString"
uid "MyString"
  end
  factory :twitter_user do
    
  end
  

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