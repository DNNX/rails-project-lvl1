# frozen_string_literal: true

require 'hexlet_code'

RSpec.describe HexletCode do # rubocop:disable Metrics/BlockLength TODO: fix later
  let(:user_class) { Struct.new(:name, :job, :gender, keyword_init: true) }
  let(:user) { user_class.new name: 'robby', job: 'hexlet', gender: 'm' }

  it 'generates forms with default action' do
    expect(described_class.form_for(user))
      .to eq('<form action="#" method="post"></form>')
  end

  it 'generates forms with given url' do
    expect(described_class.form_for(user, url: '/users'))
      .to eq('<form action="/users" method="post"></form>')
  end

  context 'when the form has input fields' do
    subject(:generated_html) do
      described_class.form_for(user) do |f|
        f.input :name
        f.input :job, as: :text
        f.input :gender, as: :select, collection: %w[m f]
      end
    end

    let(:expected_html) do
      '<form action="#" method="post">' \
      '<input type="text" value="robby" name="name">' \
      '<textarea cols="20" rows="40" name="job">hexlet</textarea>' \
      '<select name="gender">' \
      '<option value="m" selected>m</option>' \
      '<option value="f">f</option>' \
      '</select>' \
      '</form>'
    end

    it 'generates form with fields' do
      expect(generated_html).to eq(expected_html)
    end
  end

  it 'renders submit button' do
    expect(described_class.form_for(user, &:submit)).to eq(
      '<form action="#" method="post">' \
      '<input type="submit" value="Save" name="commit">' \
      '</form>'
    )
  end

  it 'renders submit button with provided text' do
    expect(described_class.form_for(user) do |f|
      f.submit('Approve')
    end).to eq('<form action="#" method="post">' \
      '<input type="submit" value="Approve" name="commit">' \
      '</form>')
  end
end
