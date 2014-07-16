require 'hangul/version'

module Hangul
  autoload :Hangul, 'hangul/hangul.rb'
end

class String
  def to_roman
    puts 'This implementation in String is deprecated; use Hangul::Hangul.to_roman.'
    Hangul::Hangul.to_roman(self)
  end
end
