require_relative 'lib/app_logger'
require_relative 'lib/parser'

class Import
  CAPTERRA = 'capterra'
  SOFTWAREADVICE = 'softwareadvice'

  PARSER_LIST = [CAPTERRA, SOFTWAREADVICE].freeze

  attr_reader :parser, :filepath
  attr_reader :logger

  def initialize(parser = nil, filepath = nil)
    @parser, @filepath = PARSER_LIST.include?(ARGV[0].to_s.downcase) ? ARGV : [parser, filepath]
    @logger = AppLogger::CustomLogger.new(STDOUT)
  end

  def run
    return if parser.nil? || filepath.nil?

    begin
      rows = Object.const_get("::Parser::#{parser.capitalize}").parse_and_transform(filepath)
    rescue NameError => e
      raise(NameError, "Invalid name for parser.")
    end

    rows.each {|row| logger.importing row }
  end

end

Import.new.run