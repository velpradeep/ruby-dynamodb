# frozen_string_literal: true

#require_relative '../base_configuration.rb' #uncomment this line if want to run this specific file only
# Delete Existing table in queries
class DeleteTable
  include BaseConfiguration

  def execute
    params = generate_params
    begin
      result = @dynamodb.delete_table(params)
      p result
      puts 'Deleted Table'
    rescue Aws::DynamoDB::Errors::ServiceError => e
      puts 'Unable to delete table:'
      puts e.message.to_s
    end
  end

  private
  def generate_params
    {
        table_name: 'Movies'
    }
  end
end

# DeleteItem.new.execute