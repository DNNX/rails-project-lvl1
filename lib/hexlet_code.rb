# frozen_string_literal: true

require 'hexlet_code/form'

# Module for generating forms.
module HexletCode
  def self.form_for(model, url: '#')
    Form.new(model, url: url) do |f|
      yield f if block_given?
    end.to_s
  end
end
