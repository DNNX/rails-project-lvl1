# frozen_string_literal: true

require 'hexlet_code/form'

# TODO: add test case for url
RSpec.describe HexletCode::Form do
  subject(:builder) { described_class.new(model) }

  let(:model_class) { Struct.new(:full_name, :email, :currency, keyword_init: true) }
  let(:model) { model_class.new(full_name: 'John Doe', email: 'john@example.com', currency: 'USD') }

  it 'renders text input with label' do
    builder.input(:full_name)

    expect(builder.to_s).to eq \
      '<form action="#" method="post">' \
      '<label for="full_name">Full name</label><input type="text" value="John Doe" name="full_name">' \
      '</form>'
  end

  it 'renders textarea input with label' do
    builder.input(:full_name, as: :text)

    expect(builder.to_s).to eq \
      '<form action="#" method="post">' \
      '<label for="full_name">Full name</label><textarea cols="20" rows="40" name="full_name">John Doe</textarea>' \
      '</form>'
  end

  it 'renders select input with label' do
    builder.input(:currency, as: :select, collection: %w[USD EUR])

    expect(builder.to_s).to eq \
      '<form action="#" method="post">' \
      '<label for="currency">Currency</label><select name="currency"><option value="USD" selected>USD</option><option value="EUR">EUR</option></select>' \
      '</form>'
  end

  it 'renders submit button' do
    builder.submit('Approve')

    expect(builder.to_s).to eq \
      '<form action="#" method="post">' \
      '<input type="submit" value="Approve" name="commit">' \
      '</form>'
  end

  it 'remembers all the calls to the rendering methods' do
    builder.input(:full_name)
    builder.submit

    expect(builder.to_s).to eq(
      '<form action="#" method="post">' \
      '<label for="full_name">Full name</label>' \
      '<input type="text" value="John Doe" name="full_name">' \
      '<input type="submit" value="Save" name="commit">' \
      '</form>'
    )
  end

  it 'fails when input type is unknown' do
    expect do
      builder.input(:currency, as: :it_feels_good_to_be_a_gangsta)
    end.to raise_error('Unknown input type: :it_feels_good_to_be_a_gangsta')
  end
end
