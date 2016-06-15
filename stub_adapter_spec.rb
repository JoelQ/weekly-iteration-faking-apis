require "rails_helper"

describe ShoppingCart do
  it "calculates tax" do
    item = create(:item)
    shopping_cart = ShoppingCart.new(item)

    allow(QuoteService).to receive(:fetch).and_return(100)

    expect(shopping_cart.tax).to eq 10
  end
end
