# frozen_string_literal: true

module HexletCode
  # Tag builder for HTML tags.
  module Tag
    def self.build(tag_name, attributes = {})
      buffer = +'<'
      buffer << tag_name
      write_attributes(buffer, attributes)
      buffer << '>'
      buffer << yield.to_s << '</' << tag_name << '>' if block_given?
      buffer
    end

    def self.write_attributes(buffer, attributes)
      attributes.each do |name, value|
        # TODO: escaping
        buffer << ' ' << name.to_s << '="' << value.to_s << '"'
      end
    end
  end
end
