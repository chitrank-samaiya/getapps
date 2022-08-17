require 'json'

module Parser
  class Softwareadvice < Base

    def self.parse_and_transform(filepath)
      JSON.parse(File.read(filepath))["products"].map do |_hash|
        {}.tap do |_inner_hash|
          _inner_hash["Name"] = _hash["title"]
          _inner_hash["Categories"] = _hash.fetch("categories", []).join(', ')
          _inner_hash["Twitter"] = format_title(_hash["twitter"])
        end
      end
    end
  end
end