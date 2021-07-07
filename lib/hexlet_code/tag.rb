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
      buffer = +'<'
      buffer << @tag_name
      write_attributes(buffer)
      buffer << '>'
      buffer << @content&.call.to_s << '</' << @tag_name << '>' if @content
      buffer
    end

    private

    def write_attributes(buffer)
      @attributes.each do |name, value|
        write_attribute(buffer, name, value)
      end
    end

    def write_attribute(buffer, name, value)
      case value
      when false, nil
        # do nothing
      when true
        buffer << ' ' << name.to_s
      else
        buffer << ' ' << name.to_s << '="' << CGI.escapeHTML(value.to_s) << '"'
      end
    end
  end
end
