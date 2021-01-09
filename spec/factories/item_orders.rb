FactoryBot.define do
  factory :item_order do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { "#{rand(100..999)}-#{rand(1_000..9_999)}" }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Faker::Address.city }
    addresses     { Faker::Address.street_name }
    building      { Faker::Address.building_number }
    phone_number  { Faker::Number.between(from: 1_000_000_000, to: 99_999_999_999) }
  end
end
