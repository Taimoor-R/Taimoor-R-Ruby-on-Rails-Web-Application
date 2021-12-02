# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cart.destroy_all # DESTROY ALL CART DATA STORED PREVIOUSLY
LineItem.destroy_all # DESTROY ALL LINE ITEM DATA STORED PREVIOUSLY
Product.destroy_all # DESTROY ALL PRODUCTS DATA STORED PREVIOUSLY
User.destroy_all # DESTROY ALL USER DATA STORED PREVIOUSLY
Order.destroy_all # DESTROY ALL ORDER DATA STORED PREVIOUSLY
User.create([{email: "taimoorriz@gmail.com", password: "1234asdf", admin: true},{email: "timmy@gmail.com", password: "1234asdf"}]) # CREATE USERS 1 WITH ADMIN ACCESS AND 1 WITH USER ACCESS
# CREATE ALL PRE-EXISITING PRODUCTS FOR PRODUCTS TABLE
Product.create([
  {
    title: "Venom: Let there be Carnage",
    description: "Eddie Brock is still struggling to coexist with the shape-shifting extraterrestrial Venom. When deranged serial killer Cletus Kasady also becomes host to an alien symbiote, Brock and Venom must put aside their differences to stop his reign of terror.",
    image_url: "m1.jpeg",
    price: 10.0,
    supply: 1,
    category: "Movies"
  },
  {
    title: "007: No Time To Die",
    description: "James Bond is enjoying a tranquil life in Jamaica after leaving active service. However, his peace is short-lived as his old CIA friend, Felix Leiter, shows up and asks for help. The mission to rescue a kidnapped scientist turns out to be far more treacherous than expected",
    image_url: "m2.jpeg",
    price: 10.0,
    supply: 1,
    category: "Movies"
  },
  {
    title: "Tenet",
    description: "When a few objects that can be manipulated and used as weapons in the future fall into the wrong hands, a CIA operative, known as the Protagonist, must save the world.",
    image_url: "m3.jpeg",
    price: 12.0,
    supply: 1,
    category: "Movies"
  },
  {
    title: "Breach",
    description: "Fleeing a devastating plague on Earth, an interstellar ark comes under attack from a new threat -- a shape-shifting alien force intent on slaughtering what's left of humanity.",
    image_url: "m4.jpeg",
    price: 12.0,
    supply: 1,
    category: "Movies"
  },
  {
    title: "Fine Line - Harry Styles",
    description: "Fine Line is the second studio album by English singer and songwriter Harry Styles, released on 13 December 2019 by Columbia and Erskine Records. The album's themes involve breakups, happiness, and having sex and feeling sad as Styles has said himself.",
    image_url: "m10.jpeg",
    price: 29.0,
    supply: 1,
    category: "Music"
  },
  {
    title: "The Dark Side of the Moon - Pink Floyd",
    description: "The Dark Side of the Moon is the eighth studio album by the English rock band Pink Floyd, released on 1 March 1973 by Harvest Records.The record was conceived as an album that focused on the pressures faced by the band during their arduous lifestyle, and dealing with the apparent mental health problems suffered by former band member Syd Barrett, who departed the group in 1968.",
    image_url: "m11.jpeg",
    price: 44.0,
    supply: 10,
    category: "Music"
  },
  {
    title: "Hotel California - Eagles",
    description: "Hotel California is the fifth studio album by American rock band the Eagles. It has been ranked as one of the greatest albums of all time. In 2003 and 2012, it was ranked number 37 on Rolling Stone's list of The 500 Greatest Albums of All Time",
    image_url: "m12.jpeg",
    price: 50.0,
    supply: 1,
    category: "Music"
  },
  {
    title: "Positions - Ariana Grande",
    description: "Positions is the sixth studio album by American singer Ariana Grande. It was released by Republic Records on October 30, 2020. Grande created the album with focus on her vocals, while its subject matter conveyed emotional healing.",
    image_url: "m13.jpeg",
    price: 11.0,
    supply: 5,
    category: "Music"
  },
  {
    title: "Funko POP - Child's Play 2: Chucky",
    description: "Hi, I'm Chucky. Wanna play? The scariest doll in horror movie history has been given the Pop! Vinyl treatment with this Child's Play Chucky Pop! Vinyl Figure! The Lakeshore Strangler looks true to form wearing his blue overalls and carrying a bloodied knife. ",
    image_url: "m18.jpeg",
    price: 20.0,
    supply: 5,
    category: "Collectables"
  },
  {
    title: "Funko POP - NBA: Stephen Curry",
    description: "From NBA Steph Curry as a stylized POP vinyl from Funko. Figure stands 9 cm and comes in a window display box  ",
    image_url: "m19.png",
    price: 25.0,
    supply: 5,
    category: "Collectables"
  },
  {
    title: "Funko POP - DC Super Heroes: Harley Quinn ",
    description: " From Birds of Prey, Harley Quinn, as a stylized POP vinyl from Funko. Figure stands 9 cm and comes in a window display box ",
    image_url: "m20.png",
    price: 38.0,
    supply: 5,
    category: "Collectables"
  },
  {
    title: "Funko POP - Rick and Morty: Toxic Rick",
    description: " From Rick & Morty, Toxic Rick, as a stylized POP vinyl from Funko. Figure stands 9cm and comes in a window display box ",
    image_url: "m21.jpeg",
    price: 41.0,
    supply: 5,
    category: "Collectables"
  }
  ])
  p "Created #{Product.count} entries." # PRINT ON CONSOLE NUMBER OF ENTRIES CREATED FOR PRODUCTS
