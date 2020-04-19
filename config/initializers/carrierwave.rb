CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIARWKEX2QQ7KXRUQ4M',
      aws_secret_access_key: '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',
      region:                'eu-central-1',
  }
  config.fog_directory  = 'rendan'
end
