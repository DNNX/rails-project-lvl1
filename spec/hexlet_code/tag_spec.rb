# frozen_string_literal: true

require 'hexlet_code/tag'

RSpec.describe HexletCode::Tag do
  it 'builds simple tag' do
    expect(described_class.build('br')).to eq('<br>')
  end

  it 'builds tag with an attribute' do
    expect(described_class.build('img', src: 'path/to/image'))
      .to eq('<img src="path/to/image">')
  end

  it 'builds tag with multiple attributes' do
    expect(described_class.build('input', type: 'submit', value: 'Save'))
      .to eq('<input type="submit" value="Save">')
  end

  it 'has closing tag when a block is given' do
    expect(described_class.build('label') { 'Email' })
      .to eq('<label>Email</label>')
  end

  it 'works with a block and attributes' do
    expect(described_class.build('label', for: 'email') { 'Email' })
      .to eq('<label for="email">Email</label>')
  end
end
