Aws.config.update({
  region: 'eu-west-2',
  credentials: Aws::Credentials.new(ENV['AWS_ID'], ENV['AWS_KEY'])
})
