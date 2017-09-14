FactoryGirl.define do
  sequence :email do |number|
    "test_#{number}@test.com"
  end

  factory :user do
    first_name "Testy"
    last_name "Testerson"
    age (5..100).to_a.sample
    gender ['Male', 'Female', 'Other'].sample
    email
    password "111111"
  end
end
