# frozen_string_literal: true

module Medico
  # The base result class that is returned from operations.
  class Result
    attr_writer :state

    def initialize
      @state = nil
      @store = { errors: Hash.new { |h, k| h[k] = [] }, model: nil }
    end

    def [](key)
      return nil unless [:model, :errors].include?(key)

      @store[key]
    end

    def []=(key, value)
      case key
      when :model
        @store[key] = value
      end
    end

    def success!
      @state = true
      self
    end

    def success?
      @state == true
    end

    def failure!
      @state = false
      self
    end

    def failure?
      !success?
    end

    def errors?
      @store[:errors].any?
    end

    def full_error_messages
      @store[:errors].flat_map do |key, errors_messages|
        errors_messages.map { |single_message| [key.to_s.upcase, single_message].join("_") }
      end
    end
  end
end
