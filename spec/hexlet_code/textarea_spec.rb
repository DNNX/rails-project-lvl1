# frozen_string_literal: true

require 'hexlet_code/textarea'

RSpec.describe HexletCode::Textarea do
  it 'builds textarea tag' do
    expect(described_class.new(:job_description, 'Great job', {}).to_s)
      .to eq('<textarea cols="20" rows="40" name="job_description">Great job</textarea>')
  end

  it 'builds textarea tag with non-default options' do
    expect(described_class.new(:job_description, 'Great job', rows: 50, cols: 50).to_s)
      .to eq('<textarea cols="50" rows="50" name="job_description">Great job</textarea>')
  end
end
