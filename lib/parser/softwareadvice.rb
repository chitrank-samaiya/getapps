require 'json'

module Parser
  class Softwareadvice

    def self.parse_and_transform(filepath)
      JSON.parse(File.read(filepath))["products"].map do |_hash|
        {}.tap do |_inner_hash|
          _inner_hash["Name"] = _hash["title"]
          _inner_hash["Categories"] = _hash.fetch("categories", []).join(', ')
          _inner_hash["Twitter"] = (_hash["twitter"].split("@")[0] == "") ? _hash["twitter"] : "@#{_hash["twitter"]}" if _hash["twitter"]
        end
      end
    end
  end
end