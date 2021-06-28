# frozen_string_literal: true

require 'hexlet_code/tag'

module HexletCode
  # Textarea tag builder
  class TextareaTag
    def initialize(name, value, attributes)
      @name = name
      @value = value
      @attributes = attributes
    end

    def to_s
      Tag.build('textarea', cols: 20, rows: 40, name: @name) do
        @value
      end.to_s
    end
  end
end
