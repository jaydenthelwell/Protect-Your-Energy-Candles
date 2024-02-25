# db/seeds.rb

Candle.destroy_all
Image.destroy_all
# Edition.destroy_all
puts "Creating candle shop edition..."

candle_shop_names = ['Nirvana', 'Sass', 'Midnight','Daydream','Wonderland','Lavender Lullaby','Cherry Bomb','Amber','Coffee','Cocomo','Wildfire','Carefree']
essentials_names = ['rosie', 'baby bloo', 'jade', "black & white set"]

candle_shop_scents = ["coconut & pineapple","juicy watermelon & kiwi","sandalwood, vanilla, & musk","peach & mango","bubblegum & cotton candy","lavender, vanilla & chamomile",'cherry & almond',"amber, vanilla & spice","freshly brewed coffee & hazelnut","coconut & lime","marshmallow & smoked woods","lemon, eucalyptus & sea salt"]
essentials_scents = ['rose & peony', 'cotton candy & blueberry', 'bamboo & water lily', 'read description']

candle_shop_images = [
  "Nirvana.png",
  "Sass.png",
  "midnight.png",
  "daydream.png",
  "wonderland.png",
  "lavender_lullaby.png",
  "cherry_bomb.png",
  "amber.png",
  "coffee.png",
  "Cocomo.png",
  "wildfire.png",
  "carefree.png"
]

essentials_images = [
  "pink_candle.png",
  "blue_candle.png",
  "green_candle.png",
  "black_white_candle.png"
]

candle_shop_description = [
  "Transport yourself to paradise with the tropical fusion of coconut and pineapple, creating a blissful escape.",
  "Infused with sass and vibrancy, our tantalizing blend of juicy watermelon and kiwi brings a burst of refreshing energy to your surroundings.",
  "Indulge in the allure of the night with our intoxicating blend of sandalwood, vanilla, and musk, a tantalizing aroma that exudes mystery and sophistication.",
  "Drift away on a cloud of euphoria with the luscious combination of peach and mango, creating a dreamy scent that transports you to sun-kissed orchards and sweet paradises.",
  "Step into your own whimsical world, where sugary-sweet bubblegum and cotton candy scents evoke memories of playful escapades and curious encounters.",
  "Drift into a state of tranquility with the soothing blend of lavender, vanilla, and chamomile, enveloping you in a sense of calm and relaxation reminiscent of a peaceful lullaby.",
  "An explosive fusion of ripe cherries and almond, creating a burst of fruity sweetness that invigorates your space with vibrant energy.",
  "Indulge in a luxurious experience with the rich blend of amber, vanilla, and spice, enveloping you in a warm, irresistible allure.",
  "Awaken your spirits with the rich aroma of freshly brewed coffee, complemented by the sweet nuttiness of hazelnut, filling your space with the comforting warmth of your favorite coffee shop.",
  "Transport yourself to a tropical paradise with the refreshing blend of coconut and lime, where every moment feels like a carefree escape to sun-drenched beaches and crystal-clear waters.",
  "Create a cozy and inviting atmosphere reminiscent of gathering around a campfire under the starry night sky, with scents of smoky woods, enhanced by the sweet aroma of marshmallow",
  "Embrace a sense of freedom and lightness with a refreshing and uplifting aroma that revitalizes your spirit and invites you to live life to the fullest."
]

essentials_description = [
  'A romantic and feminine scent that combines the sweet floral notes of rose with the soft, delicate aroma of peony blossoms.',
  'A sweet and nostalgic scent that combines the sugary sweetness of cotton candy with the juicy, fruity aroma of blueberry, creating an atmosphere of fun and delight.',
  'A serene and sophisticated scent that blends the fresh, woody notes of bamboo with the delicate, floral fragrance of water lily, creating an ambiance of tranquility and refinement.',
  'Our Black & White candle set features two contrasting yet complementary candles. Rich amber and earthy vetiver mingle to create an ambiance of mystery and sophistication. Delicate white tea and jasmine blossoms blend seamlessly, evoking a sense of tranquility and rejuvenation. Create a harmonious experience, balancing the intrigue of the night with the serenity of the day with this luxury set.'
]

puts "Creating candle shop edition..."
candle_shop = Edition.find_or_create_by(name: 'Candle Shop')
puts "Candle shop edition created: #{candle_shop.inspect}"
essentials = Edition.find_or_create_by(name: 'Essentials')

candle_shop_names.each_with_index do |name, index|
  candle = Candle.new(
    name: name.downcase,
    scent: candle_shop_scents[index],
    description: candle_shop_description[index],
    size: '200g',
    date_made: Time.now,
    stock: 100,
    price: 20,
    edition: candle_shop
  )

  3.times do
    image = Image.new(url: candle_shop_images[index])
    candle.images << image
  end

  candle.save
  puts "Candle created: #{candle.inspect}"
end

essentials_names.each_with_index do |name, index|
  candle = Candle.new(
    name: name.downcase,
    scent: essentials_scents[index],
    description: essentials_description[index],
    size: '200g',
    date_made: Time.now,
    stock: 100,
    price: 20,
    edition: essentials
  )

  3.times do
    image = Image.new(url: essentials_images[index])
    candle.images << image
  end

  unless candle.save
    puts "Error saving candle: #{candle.errors.full_messages.join(', ')}"
  end
end
