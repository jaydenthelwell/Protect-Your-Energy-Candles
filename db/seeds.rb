# db/seeds.rb

Candle.destroy_all
Image.destroy_all
Edition.destroy_all

light_edition_scents = ['Breeze', 'Serenity', 'Eucalyptus', 'Bliss', 'Waves']
dark_edition_scents = ['Woods', 'Forest', 'Amber', 'Rose', 'Obsidian']

light_edition_description = [
  "A gentle blend of lavender, chamomile, and a hint of citrus to promote relaxation. Crafted in the British countryside. Burn time approx. 45 hours. Lid included. Made with all-natural ingredients sourced locally for a truly enchanting experience.",
  "Citrus notes of bergamot and orange blossom combined with soft undertones of vanilla for a refreshing aura. Crafted in the British countryside. Burn time approx. 45 hours. Lid included. Hand-poured with care to create a soothing ambiance in every room.",
  "The clean and invigorating scent of eucalyptus, perfect for creating a spa-like atmosphere. Crafted in the British countryside. Burn time approx. 45 hours. Lid included. Infused with essential oils for a refreshing and rejuvenating experience.",
  "Calming lavender mixed with subtle notes of jasmine and cedarwood to induce tranquility. Crafted in the British countryside. Burn time approx. 45 hours. Lid included. Ethically made with sustainable practices to promote well-being and relaxation.",
  "A light, aquatic scent reminiscent of a coastal breeze, with hints of sea salt and driftwood. Crafted in the British countryside. Burn time approx. 45 hours. Lid included. Inspired by the serene beauty of nature, this candle brings the outdoors inside."
]

dark_edition_description = [
  "A blend of sandalwood, patchouli, and dark musk for a mysterious and grounding ambiance. Crafted in the British countryside. Burn time approx. 45 hours. Lid included. Infused with exotic spices to create a rich and captivating atmosphere.",
  "Earthy notes of cedarwood, pine, and a touch of moss for a deep, mystical scent. Crafted in the British countryside. Burn time approx. 45 hours. Lid included. Inspired by ancient forests, this candle transports you to a world of enchantment.",
  "Warm and alluring amber combined with hints of vanilla and spice for an exotic experience. Crafted in the British countryside. Burn time approx. 45 hours. Lid included. Handcrafted with precision to evoke warmth and sensuality in any space.",
  "A dark floral blend of roses and velvety petals, underscored by a touch of oud. Crafted in the British countryside. Burn time approx. 45 hours. Lid included. Unwind with the sultry fragrance of this carefully curated blend, designed to enhance moments of self-reflection.",
  "A rich, complex scent with leather, incense, and smoky notes for an intense and captivating atmosphere. Crafted in the British countryside. Burn time approx. 45 hours. Lid included. Immerse yourself in the allure of this unique fragrance, perfect for creating a cozy and sophisticated ambiance."
]

light_edition = Edition.find_or_create_by(name: 'Light Edition')
dark_edition = Edition.find_or_create_by(name: 'Dark Edition')

light_edition_scents.each_with_index do |name, index|
  candle = Candle.new(
    scent: name.downcase,
    description: light_edition_description[index],
    size: '200g',
    date_made: Time.now,
    stock: 100,
    price: 20,
    edition: light_edition
  )

  3.times do
    # image = Image.new(url: "https://candle-shack.co.uk/cdn/shop/files/whitejar-30cl-simplicityrange.jpg?v=1691570725&width=1100")
    image = Image.new(url: "https://solanasimply.com/cdn/shop/products/SolanaCleanCandleRefillKnoxvilleCaramelViolet-34copy_800x.jpg?v=1646064530")
    candle.images << image
  end

  candle.save
  puts "Candle created: #{candle.inspect}"
end

dark_edition_scents.each_with_index do |name, index|
  candle = Candle.new(
    scent: name.downcase,
    description: dark_edition_description[index],
    size: '200g',
    date_made: Time.now,
    stock: 100,
    price: 20,
    edition: dark_edition
  )

  3.times do
    image = Image.new(url: "https://candle-shack.co.uk/cdn/shop/files/30clblackjar-simplicity.jpg?v=1691571205&width=1100")
    candle.images << image
  end

  candle.save
  puts "Candle created: #{candle.inspect}"
end
