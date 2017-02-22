require "faker"

30.times do |i|
  restaurant = Restaurant.create(name: Faker::Name.name, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone, category: ["chinese", "italian", "japanese", "french", "belgian"].sample)
  5.times do |i|
    review = Review.new(content: Faker::Hipster.paragraphs(2), rating: Faker::Number.between(1,5))
    review.restaurant = restaurant
    review.save
  end
end
