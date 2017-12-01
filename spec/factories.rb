FactoryBot.define do
  factory(:user) do
    name("Test User")
    email("test@test.com")
    password("test1234")
    password_confirmation("test1234")
  end

  factory(:product) do
    name("Test Product")
    description("An example craft for Craftsy.")
    price(10)
  end

  factory(:review) do
    user
    product
    rating(4)
    comments("This is an example review text.")
  end
end
