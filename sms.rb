class Sms
  cattr_accessor :client

  client = Twilio::Client.new

  # sms methods
end

Sms.client = FakeTwilio::Client
