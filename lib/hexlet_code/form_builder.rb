# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'
require 'hexlet_code/input_tag'
require 'hexlet_code/textarea_tag'
require 'hexlet_code/select_tag'
require 'hexlet_code/label_tag'

# Module for generating forms.
module HexletCode
  # Builds the form contents.
  class FormBuilder
    def initialize(model)
      @model = model
      @buffer = +''
    end

    def input(name, attributes = {})
      @buffer << label(name) << input_field(name, attributes)
    end

    def submit(value = 'Save')
      @buffer << Tag.build('input', type: :submit, value: value, name: :commit)
    end

    def to_s
      @buffer.to_s
    end

    private

    def label(name)
      LabelTag.new(name).to_s
    end

    def input_field(name, attributes)
      input_field_tag(attributes[:as])
        .new(name, @model[name], attributes)
        .to_s
    end

    def input_field_tag(input_type)
      case input_type
      when nil     then InputTag
      when :text   then TextareaTag
      when :select then SelectTag
      else         raise "Unknown input type: #{input_type.inspect}"
      end
    end
  end
end
