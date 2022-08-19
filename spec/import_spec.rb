require './import'

# spec/import_spec.rb
describe Import do

  describe "run" do
    let(:import) { described_class.new }
    let(:custom_logger) { described_class.new.logger }
    let(:invalid_import) { described_class.new("dummy", "feed-products/capterra.yaml") }
    let(:valid_import) { described_class.new("capterra", "feed-products/capterra.yaml") }

    context "should invoke logger" do
      it "it should be kind of AppLogger::CustomLogger" do
        expect(custom_logger).to be_kind_of(AppLogger::CustomLogger)
      end
    end

    context "with invalid inputs" do

      it "should return nil passing no arguments" do
        expect(import.run).to be_nil
      end

      it "should raise error passing wrong parser" do
        expect { invalid_import.run }.to raise_error(NameError)
      end

    end

    context "with valid inputs" do
      it "should return data" do
        expect(valid_import.run).not_to be_nil
      end
    end
  end
end