module Hangul
  module Dicts
    class Korean
      def initialize(&params)
        @dictionary_file = 'korean.yml'
        @dictionaries = {}
        @DICT_DIR = params ? params[:dict_dir] : '/Users/aelaa/projects/hangul/lib/dictionaries/'
        @dictionary = YAML.load_file(@DICT_DIR + @dictionary_file)
      end

      def preprocess text
        out = ''
        text = text.split_ko.join
        text.enum_for(:each_char).each_with_index do |char, index|
          if char == 'ㅇ'
            unless is_vowel?(text[index + 1])
              out << char
            end
          else
            out << char
          end
        end
        out
      end

      def transcript text, preprocess = true
        out = ''
        if preprocess
          text = preprocess text
        end
        text.each_char do |char|
          out += (@dictionary['table']['from'][char] || char.to_s)
        end
        out
      end

      def is_vowel? char
        'ㅛㅕㅑㅐㅔㅗㅓㅏㅣㅠㅜㅡ'.include? char if char
      end
    end
  end
end
