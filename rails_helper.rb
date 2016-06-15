RSpec.configure do |config|
  config.before(:each) { Analytics.backend = FakeAnalyticsRuby.new }
end
