# frozen_string_literal: true

require 'hexlet_code/tag'
require 'hexlet_code/input'
require 'hexlet_code/submit'
require 'hexlet_code/label'
require 'hexlet_code/textarea'
require 'hexlet_code/select'

module HexletCode
  # Input tag builder
  class Form
    attr_reader :model, :url, :children

    def initialize(model, url: '#')
      @model = model
      @url = url
      @children = []
      yield self if block_given?
    end

    def input(name, attributes = {})
      @children << label(name) << input_field(name, attributes)
      self
    end

    def submit(value = 'Save')
      @children << submit_field(value)
      self
    end

    def to_s
      Tag.build('form', action: @url, method: :post) do
        @children.map(&:to_s).join
      end.to_s
    end

    private

    def label(name)
      Label.new(name)
    end

    def input_field(name, attributes)
      attributes = attributes.dup
      as = attributes.delete(:as)

      input_field_class(as)
        .new(name, @model[name], attributes)
    end

    def input_field_class(input_type)
      case input_type
      when nil     then Input
      when :text   then Textarea
      when :select then Select
      else         raise "Unknown input type: #{input_type.inspect}"
      end
    end

    def submit_field(value)
      Submit.new(value)
    end
  end
end
