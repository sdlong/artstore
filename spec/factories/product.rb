require "faker"

FactoryGirl.define do
  factory :product do
    title       { "macbook" }
    price       { "60000" }
    quantity    { "5" }
    description { "蘋果電腦" }
  end
end
