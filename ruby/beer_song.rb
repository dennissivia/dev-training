class Song
  def sing(stop, start = 0)
    verses = (start..stop).to_a.reverse.map do |n|
      Verse.new.verse(n)
    end
    puts verses.join("\n")
  end
end

class Verse
  VERSE_N = "%N% bottles of beer on the wall, %N% bottles of beer.\n" \
    "Take one down and pass it around, %M% bottles of beer on the wall.\n".freeze

  VERSE_2 = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n".freeze

  VERSE_1 = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n".freeze

  VERSE_0 = "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n".freeze

  STATIC_VERSES = [VERSE_0, VERSE_1, VERSE_2].freeze

  def verse(n)
    if static_verse?(n)
      STATIC_VERSES[n]
    else
      render_verse(n)
    end
  end

  private

  def render_verse(n)
    VERSE_N.gsub(/%N%/, n.to_s).gsub(/%M%/, (n - 1).to_s)
  end

  def static_verse?(n)
    n < 3
  end
end

Song.new.sing(10, 6)
Song.new.sing(5)
