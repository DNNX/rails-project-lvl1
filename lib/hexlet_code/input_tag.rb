# frozen_string_literal: true

require 'hexlet_code/tag'

module HexletCode
  # Input tag builder
  class InputTag
    def initialize(name, value, attributes)
      @name = name
      @value = value
      @attributes = attributes
    end

    def to_s
      Tag.build('input', type: :text, value: @value, name: @name).to_s
    end
  end
end
