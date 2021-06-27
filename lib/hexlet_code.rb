# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'

# Module for generating forms.
module HexletCode
  class Error < StandardError; end

  def self.form_for(model, url: '#')
    fb = FormBuilder.new(model)
    Tag.build('form', action: url, method: :post) do
      if block_given?
        yield fb
        fb
      end
    end
  end

  # Builds the form contents
  class FormBuilder
    def initialize(model)
      @model = model
      @buf = +''
    end

    def input(name, attributes = {})
      @buf <<
        case attributes[:as]
        when nil     then gen_input(name)
        when :text   then gen_textarea(name)
        when :select then gen_select(name, attributes)
        else         raise "Unknown input type: #{attributes[:as].inspect}"
        end
    end

    def submit(value = 'Save')
      @buf << Tag.build('input', type: :submit, value: value, name: :commit)
    end

    def gen_input(name)
      Tag.build('input', type: :text, value: @model[name], name: name)
    end

    def gen_textarea(name)
      Tag.build('textarea', cols: 20, rows: 40, name: name) do
        @model[name]
      end
    end

    def gen_select(name, attributes)
      val = @model[name]
      Tag.build('select', name: name) do
        attributes.fetch(:collection).map do |attr|
          Tag.build('option', value: attr, selected: attr == val) do
            attr
          end
        end.join
      end
    end

    def to_s
      @buf.to_s
    end
  end
end
