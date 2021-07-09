# frozen_string_literal: true

require 'hexlet_code/tag'

module HexletCode
  # Object which represents form submit button
  class Submit
    def initialize(value)
      @value = value
    end

    def to_s
      Tag.build('input', type: :submit, value: @value, name: :commit)
    end
  end
end
