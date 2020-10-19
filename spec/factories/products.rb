FactoryBot.define do
  factory :product do
    name                   {Faker::Name.name }
    description            {Faker::Lorem.sentence}
    category_id            {2}
    condition_id           {2}
    cost_burden_side_id    {2}
    ship_form_id           {2}
    days_to_ship_id        {2}
    price                  {300}
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/furima-logo-color.png'), filename: 'furima-logo-color.png')
    end
    
  end
end
