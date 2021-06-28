# frozen_string_literal: true

require 'hexlet_code/tag'

module HexletCode
  # Label tag builder
  class LabelTag
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
