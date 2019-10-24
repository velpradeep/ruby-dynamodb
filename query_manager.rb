# frozen_string_literal: true

require './base_configuration'
Dir["#{File.dirname(__FILE__)}/**/queries/*.rb"].each { |file| require file }

# class for running commands in queries
class QueryManager
  COMMANDS = %w[ListTable DeleteTable CreateTable
                PutItem GetItem DeleteItem].freeze

  def self.run_commands
    COMMANDS.each do |command|
      runnable_class = Object.const_get(command).new
      runnable_class.execute
    end
  end
end

QueryManager.run_commands


