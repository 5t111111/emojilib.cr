require "option_parser"
require "../emojilib"

reverse = false

OptionParser.parse! do |parser|
  parser.banner = "Usage: emojicr [arguments]"
  parser.on("-r", "--reverse", "Replace actual emojis with words") { reverse = true }
end

text = ARGV.join(" ")

if reverse
  print Emojilib.reverse_replace(text)
else
  print Emojilib.replace(text)
end
