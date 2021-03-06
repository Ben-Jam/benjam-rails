# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# Top level items: ID, name, position
#
Client.create( id: 1000, name: "ben")

audio = File.read("app/assets/audio/iwant.mp3")
image = File.read("app/assets/images/iwant.png")

Item.create( id: 1000, name: "I want...", client_id: 1000, audio: audio, position: 1, image: image)


item_list = [
  [ 1, "Food", 2, "c_food.jpg", "c_food.mp3" ],
  [ 2, "TV", 3, "c_tv.jpg", "c_tv.mp3" ],
  [ 3, "pool", 4, "c_swim.jpg", "c_swim.mp3"],
  [ 4, "Computer", 1, "c_computer.jpg", "c_computer.mp3" ]
]

item_list.each do |id, name, position, image_path, audio_path|
  image = File.read("app/assets/images/#{image_path}")
  audio = File.read("app/assets/audio/#{audio_path}")
  Item.create( id: id,  client_id: 1000 ,name: name, position: position, image: image, audio: audio, parent_id: 1000)
end


# Second level items: ID, name, parent, position
#
children_item_list = [
  [ 5, "biscuit", 1, 1, "biscuit.jpg", "biscuit.mp3" ],
  [ 6, "bread", 1, 2, "bread.jpg", "bread.mp3" ],
  [ 7, "breadsticks2", 1, 3, "breadsticks.jpg", "breadsticks.mp3" ],
  [ 8, "dinner", 1, 4 , "dinner.jpg", "dinner.mp3"],
  [ 9, "lollies", 1, 5, "lollies.jpg", "lollies.mp3" ],
  [ 10, "pink biscuit", 1, 6, "pinkbiscuit.jpg", "pinkbiscuit.mp3" ],
  [ 11, "rice cakes", 1, 7, "ricecrackers.jpg", "ricecrackers.mp3" ],
  [ 12, "nutella toast", 1, 8, "toast.jpg", "toast.mp3" ],


  [ 13, "Barney", 2, 1, "i_admin.png", "barney.mp3" ],
  [ 14, "Brainy Baby", 2, 2, "i_admin.png", "brainybaby.mp3"  ],
  [ 15, "Elmo", 2, 3, "i_admin.png", "elmo.mp3"  ],
  [ 16, "Giggle Bellies", 2, 4, "i_admin.png", "gigglebellies.mp3"  ],
  [ 17, "Hi-5", 2, 5, "tv_high5.jpg", "hi5.mp3"  ],
  [ 18, "music", 2, 6, "i_admin.png", "music.mp3"  ],
  [ 19, "Wiggles", 2, 7, "tv_wiggles.jpg", "wiggles.mp3"  ],

  [ 20, "Elmo and I know it", 4, 1,"i_admin.png", "elmoandiknowit.mp3"  ],
  [ 21, "Gangnam Style", 4, 2, "i_admin.png", "gangnamstyle.mp3"  ],
  [ 22, "Giggle Bellies", 4, 3, "i_admin.png", "gigglebellies.mp3"  ],
  [ 23, "Hi-5", 4, 4, "tv_high5.jpg", "hi5.mp3"  ],
  [ 24, "One Direction", 4, 5, "i_admin.png", "onedirection.mp3"  ]
]

children_item_list.each do |id, name, parent, position, image_path, audio_path|
  image = File.read("app/assets/images/#{image_path}")
  audio = File.read("app/assets/audio/#{audio_path}")
  Item.create( id: id, client_id: 1000 , name: name, parent_id: parent, position: position, image: image, audio: audio )
end


Client.create( id: 2000, name: "mary")


ActiveRecord::Base.connection.reset_pk_sequence!('items')

Item.create( id: 2000, name: "Hugs", client_id: 2000 , position: 1)
