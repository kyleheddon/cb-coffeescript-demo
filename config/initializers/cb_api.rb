require 'cb'

Cb.configure do |config|
  config.dev_key    = ENV['CB_MOBILE_DEV_KEY']
  config.time_out   = 5
  config.use_json = true
end