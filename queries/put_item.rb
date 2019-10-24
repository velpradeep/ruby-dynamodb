# frozen_string_literal: true

#require_relative '../base_configuration.rb' #uncomment this line if want to run this specific file only
# Add new item into table in queries

class PutItem
  include BaseConfiguration

  def execute
    movies = parse_file
    movies.each do |movie|
      params = { table_name: 'Movies', item: movie }
      begin
        @dynamodb.put_item(params)
        puts 'Added movie: ' + movie['year'].to_i.to_s + ' - ' + movie['title']
      rescue  Aws::DynamoDB::Errors::ServiceError => e
        puts 'Unable to add movie:'
        puts e.message
      end
    end
  end

  private

  def parse_file
    file = File.read('queries/movie_data.json')
    JSON.parse(file)
  end
end

# PutItem.new.execute