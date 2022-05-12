# frozen_string_literal: true

module Medico
  # The operation base class that all operations inherit from.
  # Provides the API to write simpler operations.
  class BaseOperation
    class << self
      def call(params)
        new(params).call
      end
    end

    def initialize(params = {})
      @result = Medico::Result.new
      @options = { result: @result, params: params }
    end

    # Every child class needs to implement this method
    def call
      raise "Implement this method"
    end

    private

    attr_reader :options
    attr_accessor :result

    def params
      options[:params]
    end

    def find_by_id(klass)
      id = params.fetch(:id)
      options[:model] = klass.find_by_id(id)
      handle_result_for(options[:model], :model)
    end

    def find_by_email(klass)
      email = params.fetch(:email)
      options[:model] = klass.find_by_email(email)
      handle_result_for(options[:model], :model)
    end

    def add_model(model)
      options[:model] = model
      handle_result_for(options[:model], :model)
    end

    def handle_result_for(step_result, key)
      result.state = step_result.present?
      result[key] = step_result
      options[:result] = result
      step_result.present?
    end
  end
end
