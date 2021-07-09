# frozen_string_literal: true

require 'hexlet_code/input'

RSpec.describe HexletCode::Input do
  it 'builds input tag' do
    expect(described_class.new(:company_name, 'Omni Consumer Products', {}).to_s)
      .to eq('<input type="text" value="Omni Consumer Products" name="company_name">')
  end

  it 'allows additional attributes' do
    expect(described_class.new(:company_name, 'OCP', class: 'user-input').to_s)
      .to eq('<input type="text" value="OCP" name="company_name" class="user-input">')
  end
end
