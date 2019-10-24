# frozen_string_literal: true

require 'pry'

class DeleteItem
  include BaseConfiguration

  def execute
    params = generate_params
    begin
      result = @dynamodb.delete_item(params)
      p result
      puts 'Deleted movie'
    rescue Aws::DynamoDB::Errors::ServiceError => e
      puts 'Unable to delete an item:'
      puts e.message.to_s
    end
  end

  private
  def generate_params
    {
        table_name: 'Movies',
        key: {
            year: 2015,
            title: 'The Big New Movie'
        }
    }
  end
end

# DeleteItem.new.execute