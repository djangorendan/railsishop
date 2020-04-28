CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIARWKEX2QQW7ECHIME',
      aws_secret_access_key: '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',
      region:                'eu-central-1',
  }
  config.fog_directory  = 'rendan'
end
