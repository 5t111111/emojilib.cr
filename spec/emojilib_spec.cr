require "./spec_helper"

describe Emojilib do
  it "replaces text includes emoji words with emojified text" do
    Emojilib.replace("I :green_heart: you:exclamation:").should eq("I 💚  you❗ ")
  end

  it "replaces text includes actual emoji with text includes emoji words" do
    Emojilib.reverse_replace("I 💚 you❗").should eq ("I :green_heart: you:exclamation:")
  end

  it "gets expected emoji object by word" do
    Emojilib.emoji_for("bow").char.should eq("🙇")
    Emojilib.emoji_for("bow").keywords.should eq(["man", "male", "boy"])
    Emojilib.emoji_for("bow").category.should eq("people")
  end

  it "gets expected emoji object by word with colons" do
    Emojilib.emoji_for(":bow:").char.should eq("🙇")
  end

  it "gets expected word by emoji char" do
    Emojilib.word_for("🙇").should eq("bow")
  end
end
