require 'logger'

module AppLogger
  class CustomFormatter < Logger::Formatter

    def call(severity, time, progname, msg)
      if severity == AppLogger::CustomLogger::IMPORTING
        "#{severity.downcase}: #{msg}\n"
      else
        super
      end
    end

  end
end