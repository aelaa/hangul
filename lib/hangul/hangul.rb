module Hangul
  require 'korean-string'
  class Hangul
    attr_reader :dictionaries

    def initialize(&params)
      @dictionaries = {}
      @DICT_DIR = params ? params[:dict_dir] : '/Users/aelaa/projects/hangul/lib/dictionaries/'
      # Loading dictionaries
      Dir.foreach(@DICT_DIR) do |file|
        # We don't want '.', '..' and hidden files
        next if file[0] == '.'
        dict_name = file.split('.').first
        @dictionaries[dict_name] = YAML.load_file(@DICT_DIR + file)
      end
    end

    def transcript(from, to, text)
      from_dict = @dictionaries[from.to_s]
      to_dict = @dictionaries[to.to_s]
      preout = ''
      out = ''
      if from_dict && to_dict
        # To transcript language
        if from == :korean
          text.concat(' ').split('').each_cons(2) do |a|
            tr_a = a.join.split_ko
            tr_a[0].map! do |char|
              unless from_dict['table']['from'][char].nil?
                if from_dict['table']['from'][char].class == Array
                  char = from_dict['table']['from'][char][tr_a[0].index(char)]
                else
                  char = from_dict['table']['from'][char]
                end
              end
              char
            end
            preout << tr_a[0].join
          end
        else
          text.each_char do |char|
            preout += (from_dict['table']['from'][char] || char.to_s)
          end
        end
        unless to_dict['name'] == 'transcript'
          # To end language
          preout.each_char do |char|
            out += (to_dict['table']['to'][char] || char.to_s)
          end
        end
        return [preout, out]
      else
        raise ArgumentError, "There is no dictionary: #{from.to_s if from_dict.nil?}#{", " + to.to_s if to_dict.nil?}"
      end
    end

    def dictionaries
      @dictionaries.keys
    end

    def korean_symbol?(text)
      (0xAC00..0xD7A3).include?(text.unpack('U*')[0]) ||
        (0x3131..0x318E).include?(text.unpack('U*')[0]) ||
        (0xA960..0xA97C).include?(text.unpack('U*')[0]) ||
        (0xD7B0..0xD7BF).include?(text.unpack('U*')[0])
    end
    # Generate transcript method
    # def method_missing(name, *args, &block)
    # end
  end
end
