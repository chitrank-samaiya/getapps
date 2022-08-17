require_relative 'lib/parser'

class Import
  CAPTERRA = 'capterra'
  SOFTWAREADVICE = 'softwareadvice'

  PARSER_LIST = [CAPTERRA, SOFTWAREADVICE].freeze

  def run
    unless PARSER_LIST.include?(ARGV[0].downcase)
      p "Invalid parser."
      return
    end

    data = Object.const_get("::Parser::#{ARGV[0].capitalize}").parse_and_transform(ARGV[1])

    data.each {|row| p row }
  end

end

Import.new.run