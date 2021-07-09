# frozen_string_literal: true

require 'hexlet_code/tag'

module HexletCode
  # Object which represents form label
  class Label
    def initialize(name)
      @name = name
    end

    def to_s
      Tag.build('label', for: @name) { humanize(@name) }
    end

    private

    def humanize(text)
      text.to_s.tr('_', ' ').sub(/\A./, &:upcase)
    end
  end
end
