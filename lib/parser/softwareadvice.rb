require 'json'

module Parser
  class Softwareadvice < Base

    def self.parse_and_transform(filepath)
      JSON.parse(File.read(filepath))["products"].map do |_hash|
        _new_hash = {}.tap do |_tap_hash|
          _tap_hash["Name"] = _hash["title"]
          _tap_hash["Categories"] = _hash.fetch("categories", []).join(', ')
          _tap_hash["Twitter"] = TITLE_PROC.call(_hash["twitter"], "@")
        end
        MESSAGE_FORMATION_PROC.call(_new_hash)
      end
    end
  end
end