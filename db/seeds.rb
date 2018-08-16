Booking.destroy_all
Board.destroy_all
User.destroy_all
Conversation.destroy_all

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



Conversation.create!(
  sender_id: 1,
  receiver_id: 1)

# Snowboards
  board_1 = Board.create!(
    name: "Snowmaster 3000",
    category: "Snowboard",
    location: "Geneva, Switzerland",
    description: "The best board.
                  Period.
                  Ain't nothing better than this.
                  For realz.
                  Seriously.",
    price: 300.00,
    user: User.all.sample
  )

  board_2 = Board.create!(
    name: "Snowstorm XX",
    category: "Snowboard",
    location: "Zurich, Switzerland",
    description: "Amazing board for the perfect adventure.",
    price: 500.00,
    user: User.all.sample
  )

  board_3 = Board.create!(
    name: "Normal Snowboard ",
    category: "Snowboard",
    location: "Munich, Germany",
    description: "The perfect board for beginners. It has already been used a lot, but still in a very good condition",
    price: 50.00,
    user: User.all.sample
  )

  board_4 = Board.create!(
    name: "Snowwhite",
    category: "Snowboard",
    location: "Munich, Germany",
    description: "Stylish board for an amazihng experience",
    price: 100.00,
    user: User.all.sample
  )

  board_5 = Board.create!(
    name: "Bully the Beast",
    category: "Snowboard",
    location: "Vienna, Austria",
    description: "No one will get in your way with this board!",
    price: 1000.00,
    user: User.all.sample
  )


5.times do
  board = Board.create!(
    name: "Skatemaster 2000",
    category: "Skateboard",
    location: "NYC",
    description: "great skateboard",
    price: 300.00,
    user: User.all.sample
  )
end

5.times do
  board = Board.create!(
    name: "Surfmaster 5000",
    category: "Surfboard",
    location: "Sydney",
    description: "great surfboard",
    price: 300.00,
    user: User.all.sample
  )
end

