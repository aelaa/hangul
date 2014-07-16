require 'korean-string'
require_relative 'table.rb'

module Hangul
  class Hangul
    def korean_symbol?(text)
      (0xAC00..0xD7A3).include?(text.unpack('U*')[0]) ||
      (0x3131..0x318E).include?(text.unpack('U*')[0]) ||
      (0xA960..0xA97C).include?(text.unpack('U*')[0]) ||
      (0xD7B0..0xD7BF).include?(text.unpack('U*')[0])
    end

    def self.to_roman(text)
      result = ''
      text.concat(' ').split('').each_cons(2) do |a|
        tr_a = a.join.split_ko
        tr_a[0].map! do |char|
          if HANGUL_TABLE.include? char
            if HANGUL_TABLE[char].class == Array
              char = HANGUL_TABLE[char][tr_a[0].index(char)]
            else
              char = HANGUL_TABLE[char]
            end
          end
          char
        end
        result << tr_a[0].join
      end
      result
    end
  end
end
