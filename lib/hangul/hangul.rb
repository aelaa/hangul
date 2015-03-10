module Hangul
  class Hangul
    attr_reader :dictionaries

    def initialize(&params)
      @dictionaries = {}
      @DICT_DIR = params ? params[:dict_dir] : 'lib/dictionaries/'
      # Loading dictionaries
      Dir.foreach(@DICT_DIR) do |file|
        # We don't want '.', '..' and hidden files
        next if file[0] == '.'
        dict_name = file.split('.').first
        @dictionaries[dict_name] = YAML.load_file(@DICT_DIR + file)
      end
    end

    def transcript(from, to, text)
      from_dict = @dictionaries[from]
      to_dict = @dictionaries[to]
      out = ''
      if from_dict && to_dict
        # To transcript language
        text.each_char do |char|
          out += (from_dict['table'][char] || char.to_s)
        end
        return out
      else
        raise ArgumentError, "There is no dictionary: #{from.to_s if from_dict.nil?}#{", " + to.to_s if to_dict.nil?}"
      end
    end

    def dictionaries
      @dictionaries.keys
    end

    # Generate transcript method
    # def method_missing(name, *args, &block)
    # end
  end
end
