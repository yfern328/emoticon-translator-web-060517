require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)

  hash = {}
  hash["get_meaning"] = {}
  hash["get_emoticon"] = {}

  emoticons.each do |meaning, arr|
    arr.each do |emoticon|
      hash["get_meaning"][arr.last] = meaning
      hash["get_emoticon"][arr.first] = arr.last
    end
  end

  hash

end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  library["get_emoticon"].include?(emoticon) ? library["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library["get_meaning"].include?(emoticon) ? library["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end
