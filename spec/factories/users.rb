FactoryBot.define do
  factory(:user) do
    sequence(:email) {|n| "#{n}@example.com"}
    password { 'khan1234' }
  end
end
