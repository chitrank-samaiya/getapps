require './lib/parser'

# spec/parser/base_spec.rb
describe Parser::Base do
  describe "validate proc" do

    context "title proc" do
      let(:splitter) { "!" }

      it "should not return empty title" do
        expect(Parser::Base::TITLE_PROC.call(nil, splitter)).to be_nil
      end

      it "should return valid title" do
        expect(Parser::Base::TITLE_PROC.call("test", splitter)).to eq("#{splitter}test")
      end
    end

    context "message formation proc" do
      it "should only call Hash object" do
        expect(Parser::Base::MESSAGE_FORMATION_PROC.call(["Array"])).to be_nil
      end

      it "return formatted message" do
        expect(Parser::Base::MESSAGE_FORMATION_PROC.call({"Name": "title"})).not_to be_nil
      end
    end
  end
end