require "rails_helper"

describe ShoppingCart do
  it "calculates tax" do
    item = create(:item)
    shopping_cart = ShoppingCart.new(item)

    stub_request("http://quote-service.com/prices").and_return(
      { pricesRequest: { regularPrice: 100 } }.to_json
    )

    expect(shopping_cart.tax).to eq 10
  end
end
