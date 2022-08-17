require_relative 'lib/parser'

class Import
  CAPTERRA = 'capterra'
  SOFTWAREADVICE = 'softwareadvice'

  PARSER_LIST = [CAPTERRA, SOFTWAREADVICE].freeze

  attr_reader :parser, :filepath

  def initialize(parser = nil, filepath = nil)
    @parser =  parser
    @filepath = filepath
  end

  def run
    unless parser && PARSER_LIST.include?(parser.downcase)
      p "Invalid parser."
      return
    end

    if filepath.nil?
      p "Invalid path of file"
      return
    end

    rows = Object.const_get("::Parser::#{parser.capitalize}").parse_and_transform(filepath)

    rows.each {|row| p row }
  end

end

Import.new.run