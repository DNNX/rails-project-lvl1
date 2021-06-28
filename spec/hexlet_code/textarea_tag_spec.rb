# frozen_string_literal: true

require 'hexlet_code/textarea_tag'

RSpec.describe HexletCode::TextareaTag do
  it 'builds textarea tag' do
    expect(described_class.new(:job_description, 'Great job', {}).to_s)
      .to eq('<textarea cols="20" rows="40" name="job_description">Great job</textarea>')
  end
end
