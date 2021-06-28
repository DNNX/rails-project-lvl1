# frozen_string_literal: true

require 'hexlet_code/select_tag'

RSpec.describe HexletCode::SelectTag do
  subject(:rendered_html) { described_class.new(:currency, 'USD', collection: %w[RUB USD EUR]).to_s }

  let(:expected_html) do
    '<select name="currency">' \
      '<option value="RUB">RUB</option>' \
      '<option value="USD" selected>USD</option>' \
      '<option value="EUR">EUR</option>' \
      '</select>'
  end

  it 'builds select tag' do
    expect(rendered_html).to eq(expected_html)
  end

  context 'when collection is not provided' do
    subject(:render_html) { described_class.new(:currency, 'USD', {}).to_s }

    it 'raises an error' do
      expect { render_html }.to raise_error(KeyError, 'key not found: :collection')
    end
  end
end
