# frozen_string_literal: true

require 'hexlet_code/tag'

module HexletCode
  # Object which represents select tag with options
  class Select
    def initialize(name, value, attributes)
      @name = name
      @value = value
      @attributes = attributes
    end

    def to_s
      Tag.build('select', name: @name) do
        collection.map(&method(:option_tag)).join
      end
    end

    private

    def collection
      @attributes.fetch(:collection)
    end

    def option_tag(option_value)
      Tag.build('option', value: option_value, selected: option_value == @value) do
        option_value
      end
    end
  end
end
