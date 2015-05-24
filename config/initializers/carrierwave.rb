CarrierWave.configure do |config|
  config.storage = :file
  #config.asset_host = ActionController::Base.asset_host
  config.asset_host = 'http://192.168.0.8:3000'
end
