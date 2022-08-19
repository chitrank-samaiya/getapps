require './lib/app_logger'

# spec/custom_logger_spec.rb
describe AppLogger::CustomLogger do

  describe "logger" do
    let(:custom_logger) { described_class.new(STDOUT) }

    context "should invoke logger methods" do
      it "it should invoke info" do
        expect(custom_logger.info("info")).to be_truthy
      end

      it "it should invoke error" do
        expect(custom_logger.error("error")).to be_truthy
      end

      it "it should invoke debug" do
        expect(custom_logger.debug("debug")).to be_truthy
      end

      it "it should invoke fatal" do
        expect(custom_logger.fatal("fatal")).to be_truthy
      end

      it "it should invoke warn" do
        expect(custom_logger.warn("warn")).to be_truthy
      end

      it "it should invoke importing" do
        expect(custom_logger.importing("importing")).to be_truthy
      end

    end

  end
end