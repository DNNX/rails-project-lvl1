# frozen_string_literal: true

require 'hexlet_code/input_tag'

RSpec.describe HexletCode::InputTag do
  it 'builds input tag' do
    expect(described_class.new(:company_name, 'Omni Consumer Products', {}).to_s)
      .to eq('<input type="text" value="Omni Consumer Products" name="company_name">')
  end
end
