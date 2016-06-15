class QuoteService
  UnhandledResponseError = Class.new(StandardError)

  cattr_accessor :base_url_endpoint

  self.base_url_endpoint = ENV.fetch("QUOTE_SERVICE_BASE_URL_ENDPOINT")

  def self.fetch(item)
    new(item).fetch
  end

  def initialize(item)
    @item = item
  end

  def fetch
    response = HTTParty.post(
      self.class.base_url_endpoint + "/prices",
      body: post_parameters.to_json,
      format: :json
    )

    case response.code
    when 422
      InvalidQuote.new
    when 200..299
      price = response.fetch("pricesRequest").fetch("regularPrice")
      Quote.new(trip_id: item.id, value: price)
    else
      raise UnhandledResponseError
    end
  end

  private

  attr_reader :item

  def post_parameters
    # ..
  end
end
