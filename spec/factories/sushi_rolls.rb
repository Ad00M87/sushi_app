FactoryGirl.define do
  factory :sushi_roll do
    name "MyString"
    price (10..20).to_a.sample
    roll_count (0..10).to_a.sample
    spicy true
    fish ['Tuna', 'Salmon', 'Cod', 'Octopus', 'Squid', 'Halibut'].sample
    wrap ['Seaweed', 'Deep fried', 'Rice wrap', 'Bacon'].sample
    user
  end
end
