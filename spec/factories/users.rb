FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    last_name_kanji       {Gimei.last.kanji }
    first_name_kanji      {Gimei.first.kanji}
    last_name_kana        {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    birthday              {Faker::Date.birthday}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end