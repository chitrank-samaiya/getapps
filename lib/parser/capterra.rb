require 'yaml'

module Parser
  class Capterra

    def self.parse_and_transform(filepath)
      YAML.load_file(filepath).map do |_hash|
        {}.tap do |_inner_hash|
          _inner_hash["Name"] = _hash["name"]
          _inner_hash["Categories"] = _hash["tags"]
          _inner_hash["Twitter"] = (_hash["twitter"].split("@")[0] == "") ? _hash["twitter"] : "@#{_hash["twitter"]}" if _hash["twitter"]
        end
      end
    end
  end
end