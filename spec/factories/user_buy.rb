FactoryBot.define do
  factory :user_buy do
    postal_code    {"894-0043"}
    region_id      {3}
    city           {Gimei.city.kanji}
    address        {Gimei.address}
    building_name  {"ハミングタウンDー201"}
    phone_number   {"090-2132-1445"}
    token {"tok_abcdefghijk00000000000000000"}
    
  end
end