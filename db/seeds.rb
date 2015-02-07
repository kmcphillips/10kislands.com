if Card.any?
  puts "Destroying existing cards"
  puts "  Deal with it"

  Card.destroy_all
end

puts "Creating example cards"
Card.create!(
  description: "\"The U Part 2\"\nESPN 30 for 30\nOriginal Music, SFX and Mix",
  link: "http://www.youtube.com/watch?v=4tOsFQAN9Yc&sns=em",
  # image: images/home-pic1.png
)

Card.create!(
  description: "Zara\nMusic Placement\nANR \"Stay Kids\"\n2014",
  link: "http://youtu.be/MX1Fpor2VAI",
  # image: images/home-pic2.png
)

Card.create!(
  description: "Mondrian Hotel\nMusic Placement\nPlains \"Little Haiti\"\n2014",
  link: "https://www.youtube.com/watch?v=pIi7rcOWgdE&feature=youtu.be"
  # image: images/home-pic3.png
)

Card.create!(
  description: "Icona Pop\n\"Light Me Up\"\nSongwriter/Producer\n2014",
  link: "https://www.youtube.com/watch?v=DnoNGqYGOXs",
  # image: images/home-pic6.png
)

Card.create!(
  description: "NICKY BLITZ\n\"Alex\"\nSingle + Video\n2014",
  link: "https://www.youtube.com/watch?v=-HIrrUJX2AY",
  # image: images/home-pic4.png
)

Card.create!(
  description: "Michael Kors\nMusic Placement\nJohn Hancock III \"Left Me\"\n2014",
  link: "https://www.youtube.com/watch?v=DeMInwNB4Ms&index=5&list=UUWZTQLvNSm92fZPnjVGFRIA",
  # image: images/home-pic5.png
)

puts "  Created #{ Card.count } cards"
