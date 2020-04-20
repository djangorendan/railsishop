CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIARWKEX2QQTVWXELML',
      aws_secret_access_key: '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',
      region:                'eu-central-1',
  }
  config.fog_directory  = 'rendan'
end
