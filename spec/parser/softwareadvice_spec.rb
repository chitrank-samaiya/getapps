require './lib/parser'

# spec/parser/softwareadvice_spec.rb
describe Parser::Softwareadvice do

  context "invalid filepath" do
    let(:invalid_data) { Parser::Softwareadvice.parse_and_transform("feed-products/abc.json") }

    it "should raise exception" do
      expect { invalid_data }.to raise_error(Errno::ENOENT)
    end
  end

  context "valid filepath" do
    let(:valid_data) { Parser::Softwareadvice.parse_and_transform("feed-products/softwareadvice.json") }

    it "should not raise exception" do
      expect { valid_data }.not_to raise_error
    end

    it "should return valid data" do
      expect(valid_data.size).to eq(2)
    end

  end

end