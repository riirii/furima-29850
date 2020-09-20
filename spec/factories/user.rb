FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    

      nickname              {Faker::Name.initials}
      email                 {Faker::Internet.free_email}
      password              {Faker::Internet.password(min_length: 6)}
      password_confirmation {password}

      first_name            {Gimei.first.kanji}
      last_name             {Gimei.last.kanji}
      first_name_kana       {Gimei.first.katakana}
      last_name_kana        {Gimei.last.katakana}
      birthday              {Faker::Date.birthday}
    end
  end
end
