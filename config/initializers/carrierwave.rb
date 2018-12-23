# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.storage    = :S3
  config.aws_bucket = ('introrails') # for AWS-side bucket access permissions config, see section below
  config.aws_acl    = 'public-read'

 

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }

  config.aws_credentials = {
    access_key_id:     ('AKIAISQ5A7QK6JXQE3IA'),
    secret_access_key: ('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'),
    region:            ('sa-east-1'), # Required
    stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
  }

  # Optional: Signing of download urls, e.g. for serving private content through
  # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
  # configured:
  # config.aws_signer = -> (unsigned_url, options) do
  #   Aws::CF::Signer.sign_url(unsigned_url, options)
  # end
end


