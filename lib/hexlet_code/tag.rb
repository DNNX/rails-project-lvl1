# frozen_string_literal: true

require 'cgi'

module HexletCode
  # Tag builder for HTML tags.
  class Tag
    def self.build(tag_name, attributes = {}, &block)
      new(tag_name, attributes, &block).to_s
    end

    def initialize(tag_name, attributes, &block)
      @tag_name = tag_name
      @attributes = attributes
      @content = block
    end

    def to_s
      if @content
        "<#{@tag_name}#{attributes}>#{@content.call}</#{@tag_name}>"
      else
        "<#{@tag_name}#{attributes}>"
      end
    end

    private

    def attributes
      @attributes.map(&method(:attribute)).join
    end

    def attribute(name, value)
      case value
      when false, nil
        ''
      when true
        " #{name}"
      else
        " #{name}=\"#{CGI.escapeHTML(value.to_s)}\""
      end
    end
  end
end
