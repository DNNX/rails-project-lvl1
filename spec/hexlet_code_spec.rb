# frozen_string_literal: true

require 'hexlet_code'

RSpec.describe HexletCode do
  let(:user_class) { Struct.new(:name, :job, keyword_init: true) }
  let(:user) { user_class.new(name: 'rob') }

  it 'has a version number' do
    expect(HexletCode::VERSION).not_to be nil
  end

  it 'generates forms with default action' do
    expect(described_class.form_for(user))
      .to eq('<form action="#" method="post"></form>')
  end

  it 'generates forms with given url' do
    expect(described_class.form_for(user, url: '/users'))
      .to eq('<form action="/users" method="post"></form>')
  end
end
