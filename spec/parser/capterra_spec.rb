require './lib/parser'

# spec/parser/capterra_spec.rb
describe Parser::Capterra do

  context "invalid filepath" do
    let(:invalid_data) { described_class.parse_and_transform("feed-products/abc.yaml") }

    it "should raise exception" do
      expect { invalid_data }.to raise_error(Errno::ENOENT)
    end
  end

  context "valid filepath" do
    let(:valid_data) { described_class.parse_and_transform("feed-products/capterra.yaml") }

    it "should not raise exception" do
      expect { valid_data }.not_to raise_error
    end

    it "should return valid data" do
      expect(valid_data.size).to eq(3)
    end

  end

end