# frozen_string_literal: true

#require_relative '../base_configuration.rb' #uncomment this line if want to run this specific file only
# Listing tables in queries
class ListTable
  include BaseConfiguration

  def initialize
    set_credentials
    set_config
    @dynamodb = Aws::DynamoDB::Resource.new
  end

  def execute
    @dynamodb.tables.each do |t|
      puts "Name:    #{t.name}"
      puts "#Items:  #{t.item_count}"
    end
  end
end

# ListTable.new.execute