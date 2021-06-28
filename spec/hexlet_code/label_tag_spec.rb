# frozen_string_literal: true

require 'hexlet_code/label_tag'

RSpec.describe HexletCode::LabelTag do
  it 'builds label tag' do
    expect(described_class.new(:company_name).to_s)
      .to eq('<label for="company_name">Company name</label>')
  end
end
