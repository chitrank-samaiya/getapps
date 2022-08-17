module Parser
  class Base
    class << self

      def format_title(title)
        return if title.nil?
        title.split("@")[0] == "" ? title : "@#{title}"
      end

    end
  end
end