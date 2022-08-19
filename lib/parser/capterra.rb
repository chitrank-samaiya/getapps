require 'yaml'

module Parser
  class Capterra < Base

    def self.parse_and_transform(filepath)
      YAML.load_file(filepath).map do |_hash|
        _new_hash = {}.tap do |_tap_hash|
          _tap_hash["Name"] = _hash["name"]
          _tap_hash["Categories"] = _hash["tags"]
          _tap_hash["Twitter"] = TITLE_PROC.call(_hash["twitter"], "@")
        end
        MESSAGE_FORMATION_PROC.call(_new_hash)
      end
    end
  end
end