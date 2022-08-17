require_relative 'lib/app_logger'
require_relative 'lib/parser'

class Import
  CAPTERRA = 'capterra'
  SOFTWAREADVICE = 'softwareadvice'

  PARSER_LIST = [CAPTERRA, SOFTWAREADVICE].freeze

  attr_reader :parser, :filepath
  attr_reader :logger

  def initialize(parser = nil, filepath = nil)
    @parser =  ARGV[0] || parser
    @filepath = ARGV[1] || filepath
    @logger = AppLogger::CustomLogger.new(STDOUT)
  end

  def format_log_message(row)
    row.map {|key, value| key == "Name" ? "#{key}: \"#{value}\"" : "#{key}: #{value}"}.join('; ')
  end

  def run
    unless parser && PARSER_LIST.include?(parser.downcase)
      logger.error "Invalid parser."
      return
    end

    if filepath.nil?
      logger.error "Invalid path of file"
      return
    end

    rows = Object.const_get("::Parser::#{parser.capitalize}").parse_and_transform(filepath)

    rows.each {|row| logger.importing format_log_message(row) }
  end

end

Import.new.run