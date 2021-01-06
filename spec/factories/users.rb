require 'faker/japanese'

FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    first_name            {"山田"}
    family_name           {"山田"}
    first_name_kana                 {"カタカナ"}
    family_name_kana                {"カタカナ"}
    birth_day                       {'1993-02-24'}
  end
end

   


    # email                           {"kkk@email.com"}
    # password                        {"00000000"}
    # password_confirmation           {"00000000"}
    # nickname                        {"abe"}
    # first_name                      {"kkkk"}
    # family_name                     {"kkk"}
    # first_name_kana                 {"カタカナ"}
    # family_name_kana                {"カタカナ"}
    # birth_day                       {'1993-02-24'}

    # nickname              {Faker::Name.initials(number: 2)}
    # email                 {Faker::Internet.free_email}
    # password              {Faker::Internet.password(min_length: 6)}
    # password              { password }
    # password_confirmation { password }