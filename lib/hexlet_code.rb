# frozen_string_literal: true

require 'hexlet_code/tag'
require 'hexlet_code/form_builder'

# Module for generating forms.
module HexletCode
  def self.form_for(model, url: '#')
    Tag.build('form', action: url, method: :post) do
      next unless block_given?

      fb = FormBuilder.new(model)
      yield fb
      fb
    end
  end
end
