# frozen_string_literal: true

require 'hexlet_code/tag'

module HexletCode
  # Object which represents input tag
  class Input
    def initialize(name, value, attributes)
      @name = name
      @value = value
      @attributes = attributes
    end

    def to_s
      Tag.build('input', {type: :text, value: @value, name: @name}.merge(@attributes)).to_s
    end
  end
end
