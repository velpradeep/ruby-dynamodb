# frozen_string_literal: true

#require_relative '../base_configuration.rb' #uncomment this line if want to run this specific file only
# Create New table in queries
class CreateTable
  include BaseConfiguration

  def execute
    params = generate_params
    begin
      result = @dynamodb.create_table(params)
      puts 'Created table. Status: ' + result.table_description.table_status

    rescue Aws::DynamoDB::Errors::ServiceError => e
      puts 'Unable to create table:'
      puts "#{e.message}"
    end
  end

  private
  def generate_params
    params = {
        table_name: 'Movies',
        key_schema: [
            {
                attribute_name: 'year',
                key_type: 'HASH'  #Partition key
            },
            {
                attribute_name: 'title',
                key_type: 'RANGE' #Sort key
            }
        ],
        attribute_definitions: [
            {
                attribute_name: 'year',
                attribute_type: 'N'
            },
            {
                attribute_name: 'title',
                attribute_type: 'S'
            }
        ],
        provisioned_throughput: {
            read_capacity_units: 10,
            write_capacity_units: 10
        }
    }

  end
end

# CreateTable.new.execute