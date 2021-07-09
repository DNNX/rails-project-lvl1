# frozen_string_literal: true

require 'hexlet_code/label'

RSpec.describe HexletCode::Label do
  it 'builds label tag' do
    expect(described_class.new(:company_name).to_s)
      .to eq('<label for="company_name">Company name</label>')
  end
end
