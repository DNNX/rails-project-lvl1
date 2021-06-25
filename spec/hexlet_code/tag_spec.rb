require 'hexlet_code/tag'

RSpec.describe HexletCode::Tag do
  it 'builds simple tags' do
    expect(HexletCode::Tag.build('br')).to eq('<br>')
  end

  it 'builds tags with attributes' do
    expect(HexletCode::Tag.build('img', src: 'path/to/image'))
      .to eq('<img src="path/to/image">')
  end
  #
# #

# HexletCode::Tag.build('input', type: 'submit', value: 'Save')
# # <input type="submit" value="Save">

# # Для парных тегов тело передается как блок
# HexletCode::Tag.build('label') { 'Email' }
# # <label>Email</label>

# HexletCode::Tag.build('label', for: 'email') { 'Email' }
# # <label for="email">Email</label>
end
