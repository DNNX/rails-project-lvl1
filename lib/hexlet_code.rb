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

    def input(name)
      @buf << Tag.build('input', type: :text, value: @model[name], name: name)
    end

    def to_s
      @buf.to_s
    end
  end
end
