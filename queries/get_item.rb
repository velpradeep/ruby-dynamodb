# frozen_string_literal: true

# require_relative '../base_configuration.rb' #uncomment this line if want to run this specific file only
# Create New table in queries
class GetItem
  include BaseConfiguration

  def execute
    params = generate_params
    begin
      result = @dynamodb.get_item(params)
      p result
      if result.item == nil
        puts 'Could not find movie'
        exit 0
      end

      puts 'Found movie:'
      puts '  Year:   ' + result.item['year'].to_i.to_s
      puts '  Title:  ' + result.item['title']
      puts '  Plot:   ' + result.item['info']['plot']
      puts '  Rating: ' + result.item['info']['rating'].to_f.to_s

    rescue Aws::DynamoDB::Errors::ServiceError => e
      puts 'Unable to retrieve an item:'
      puts "#{e.message}"
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

# GetItem.new.execute