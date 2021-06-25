# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'

# Module for generating forms.
module HexletCode
  class Error < StandardError; end

  def self.form_for(_model, url: '#')
    Tag.build('form', action: url, method: 'post') do
      # TODO: use `model` here
      ''
    end
  end
end
