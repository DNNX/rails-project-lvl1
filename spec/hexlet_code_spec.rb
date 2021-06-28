# frozen_string_literal: true

require 'hexlet_code'

RSpec.describe HexletCode do
  let(:user_class) { Struct.new(:name, :job, :gender, keyword_init: true) }
  let(:user) { user_class.new name: 'robby', job: 'hexlet', gender: 'm' }

  context 'when url is not provided' do
    it 'renders form with action=#' do
      expect(described_class.form_for(user))
        .to eq('<form action="#" method="post"></form>')
    end
  end

  context 'when url is provided' do
    it 'renders form with given url' do
      expect(described_class.form_for(user, url: '/users'))
        .to eq('<form action="/users" method="post"></form>')
    end
  end

  context 'when the form has input fields' do
    subject(:generated_html) do
      described_class.form_for(user) do |f|
        f.input :name
        f.input :job, as: :text
        f.input :gender, as: :select, collection: %w[m f]
        f.submit
      end
    end

    let(:expected_html) do
      '<form action="#" method="post">' \
        '<label for="name">Name</label>' \
        '<input type="text" value="robby" name="name">' \
        '<label for="job">Job</label>' \
        '<textarea cols="20" rows="40" name="job">hexlet</textarea>' \
        '<label for="gender">Gender</label>' \
        '<select name="gender">' \
        '<option value="m" selected>m</option>' \
        '<option value="f">f</option>' \
        '</select>' \
        '<input type="submit" value="Save" name="commit">' \
        '</form>'
    end

    it 'renders form with fields' do
      expect(generated_html).to eq(expected_html)
    end
  end
end
