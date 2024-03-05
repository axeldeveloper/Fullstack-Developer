
# FactoryBot.define do
#   factory :user do |f|
#     f.full_name "Samuel eto"
#     f.email 'jane@doe.com'
#     f.password "ruby"
#     #f.password_confrimation "ruby"
#     f.role false
#   end
# end


FactoryBot.define do
  factory :user do
    full_name { "Samuel eto"}
    sequence(:email) { |n| "user#{n}@example.com" } # Generate unique emails
    password { "demo123" }
    role { true }
  end
end