module HexletCode
  module Tag
    def self.build(tag_name, attributes = {})
      tag = +'<'
      tag << tag_name
      attributes.each do |name, value|
        # TODO: escaping
        tag << ' ' << name.to_s << '="' << value << '"'
      end
      tag << '>'
      tag
    end
  end
end
