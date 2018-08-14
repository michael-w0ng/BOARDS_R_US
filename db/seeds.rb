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

Conversation.create!(
  sender_id: 1,
  receiver_id: 1)

3.times do
  board = Board.create!(
    name: "Snowmaster 3000",
    category: "Snowboard",
    location: "Geneva, Switzerland",
    description: "The best board.
                  Period.
                  Ain't nothing better than this.
                  For realz.
                  Seriously.
                  The best board.
                  Period.
                  Ain't nothing better than this.
                  For realz.
                  Seriously.
                  The best board.
                  Period.
                  Ain't nothing better than this.
                  For realz.
                  Seriously.",
    price: 300.00,
    user: User.all.sample
  )
end

3.times do
  board = Board.create!(
    name: "Skatemaster 2000",
    category: "Skateboard",
    location: "NYC",
    description: "great skateboard",
    price: 300.00,
    user: User.all.sample
  )
end

3.times do
  board = Board.create!(
    name: "Surfmaster 5000",
    category: "Surfboard",
    location: "Sydney",
    description: "great surfboard",
    price: 300.00,
    user: User.all.sample
  )
end

