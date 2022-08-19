module Parser
  class Base
    ESCAPE_KEYS = ["Name"]
    TITLE_PROC = proc {|title, splitter| title.split(splitter).first == "" ? title : "#{splitter}#{title}" if title}
    MESSAGE_FORMATION_PROC = proc do |data|
      data.map {|key, value| ESCAPE_KEYS.include?(key) ? "#{key}: \"#{value}\"" : "#{key}: #{value}"}.join('; ') if data.is_a?(Hash)
    end

  end
end