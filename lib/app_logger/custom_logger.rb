require 'logger'

module AppLogger
  class CustomLogger < Logger
    DEBUG = "DEBUG"
    INFO = "INFO"
    WARN = "WARN"
    ERROR = "ERROR"
    FATAL = "FATAL"
    IMPORTING = "IMPORTING"
    SEVERITY = [DEBUG, INFO, WARN, ERROR, FATAL, IMPORTING].freeze

    def initialize(*args)
      super(*args)
      @formatter = CustomFormatter.new
    end

    def format_severity(severity)
      SEVERITY[severity] || 'ANY'
    end

    def importing(progname = nil, &block)
      add(5, nil, progname, &block)
    end

  end
end