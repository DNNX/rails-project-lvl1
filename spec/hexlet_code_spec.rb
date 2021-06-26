# frozen_string_literal: true

require 'hexlet_code'

RSpec.describe HexletCode do
  let(:user_class) { Struct.new(:name, :job, keyword_init: true) }
  let(:user) { user_class.new(name: 'robby') }

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
      end
    end

    it 'generates form with fields' do
      expect(generated_html).to eq(
        '<form action="#" method="post">' \
        '<input type="text" value="robby" name="name">' \
        '</form>'
      )
    end
  end
end

# HexletCode.form_for user do |f|
#   f.input :name
#   f.input :job, as: :text
#   f.input :gender, as: :select, collection: %w(m f)
# end

# <form action="#" method="post">
#   <input type="text" value="rob" name="name">
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
#   <select name="gender">
#     <option value="m" selected>m</option>
#     <option value="f">f</option>
#   </select>
# </form>
