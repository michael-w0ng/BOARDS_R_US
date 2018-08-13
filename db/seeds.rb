Booking.destroy_all
Board.destroy_all
User.destroy_all

User.create(
  [
    {
      email: "ann@example.com",
      password: "123456"
    },
    {
      email: "bob@example.com",
      password: "123456"
    },
    {
      email: "charlie@example.com",
      password: "123456"
    }
  ]
)

3.times do
  board = Board.create!(
    name: "Snowboard",
    category: "Snowboard",
    location: "Alps",
    description: "great snowboard",
    price: 300.00,
    user: User.all.sample
  )
end

3.times do
  board = Board.create!(
    name: "Skateboard",
    category: "Skateboard",
    location: "NYC",
    description: "great skateboard",
    price: 300.00,
    user: User.all.sample
  )
end

3.times do
  board = Board.create!(
    name: "Surfboard",
    category: "Surfboard",
    location: "Sydney",
    description: "great surfboard",
    price: 300.00,
    user: User.all.sample
  )
end

