require "./emojilib/*"

module Emojilib
  extend self

  def replace(text)
    text.gsub(/:(.*?):/) do |word|
      char = emoji_for(word).char
      if char.is_a?(String)
        char + " "
      end
    end
  end

  def reverse_replace(text)
    replaced_text = ""
    text.each_char do |char|
      emoji = word_for(char.to_s)
      unless emoji == ""
        replaced_text += ":#{emoji}:"
      else
        replaced_text += char
      end
    end
    replaced_text
  end

  def emoji_for(word)
    EMOJIS[remove_colons_if_exist(word)]
  end

  def word_for(char)
    result = ""
    EMOJIS.each do |key, value|
      if value.char == char
        result = key.to_s
        # break # ? why the heck break takes forever...
      end
    end
    result
  end

  private def remove_colons_if_exist(word)
    if word.starts_with?(":") && word.ends_with?(":")
      word[1...-1]
    else
      word
    end
  end
end
