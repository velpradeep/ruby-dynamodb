# frozen_string_literal: true

require 'aws-sdk-dynamodb'
#Base for configuring AWS Dynamodb
module BaseConfiguration
  API_END_POINT = 'http://localhost:8000' # url definition

  def initialize()
    set_credentials
    set_config
    @dynamodb = Aws::DynamoDB::Client.new
  end

  def self.included(base)
    #TODO -- this can be extended
  end

  private

  def set_credentials
    @credentials = Aws::Credentials.new('akid', 'secret')
  end

  def set_config
    Aws.config.update(region: 'ap-south-1',
                      credentials: @credentials,
                      endpoint: API_END_POINT)
  end
end