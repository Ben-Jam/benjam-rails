# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# Top level items: ID, name, position
#
Client.create( id: 1000, name: "ben")

audio = File.read("app/assets/audio/iwant.wav")

Item.create( id: 1000, name: "I want...", client_id: 1000, audio: audio , position: 1)


item_list = [
  [ 1, "Food", 2, "c_food.jpg", "c_food.wav" ],
  [ 2, "TV", 3, "c_tv.jpg", "c_tv.wav" ],
  [ 3, "pool", 4, "c_swim.jpg", "c_swim.wav"],
  [ 4, "Computer", 1, "c_computer.jpg", "c_computer.wav" ]
]

item_list.each do |id, name, position, image_path, audio_path|
  image = File.read("app/assets/images/#{image_path}")
  audio = File.read("app/assets/audio/#{audio_path}")
  Item.create( id: id,  client_id: 1000 ,name: name, position: position, image: image, audio: audio,parent_id: 1000)
end



# Second level items: ID, name, parent, position
#
children_item_list = [
  [ 5, "biscuit", 1, 1, "biscuit.jpg", "biscuit.wav" ],
  [ 6, "bread", 1, 2, "bread.jpg", "bread.wav" ],
  [ 7, "breadsticks", 1, 3, "breadsticks.jpg", "breadsticks.wav" ],
  [ 8, "dinner", 1, 4 , "dinner.jpg", "dinner.wav"],
  [ 9, "lollies", 1, 5, "lollies.jpg", "lollies.wav" ],
  [ 10, "pink biscuit", 1, 6, "pinkbiscuit.jpg", "pinkbiscuit.wav" ],
  [ 11, "rice cakes", 1, 7, "ricecrackers.jpg", "ricecrackers.wav" ],
  [ 12, "nutella toast", 1, 8, "toast.jpg", "toast.wav" ],


  [ 13, "Barney", 2, 1, "i_admin.png", "barney.wav" ],
  [ 14, "Brainy Baby", 2, 2, "i_admin.png", "brainybaby.wav"  ],
  [ 15, "Elmo", 2, 3, "i_admin.png", "elmo.wav"  ],
  [ 16, "Giggle Bellies", 2, 4, "i_admin.png", "gigglebellies.wav"  ],
  [ 17, "Hi-5", 2, 5, "tv_high5.jpg", "hi5.wav"  ],
  [ 18, "music", 2, 6, "i_admin.png", "music.wav"  ],
  [ 19, "Wiggles", 2, 7, "tv_wiggles.jpg", "wiggles.wav"  ],

  [ 20, "Elmo and I know it", 4, 1,"i_admin.png", "elmoandiknowit.wav"  ],
  [ 21, "Gangnam Style", 4, 2, "i_admin.png", "gangnamstyle.wav"  ],
  [ 22, "Giggle Bellies", 4, 3, "i_admin.png", "gigglebellies.wav"  ],
  [ 23, "Hi-5", 4, 4, "tv_high5.jpg", "hi5.wav"  ],
  [ 24, "One Direction", 4, 5, "i_admin.png", "onedirection.wav"  ]
]

children_item_list.each do |id, name, parent, position, image_path, audio_path|
  image = File.read("app/assets/images/#{image_path}")
  audio = File.read("app/assets/audio/#{audio_path}")
  Item.create( id: id, client_id: 1000 , name: name, parent_id: parent, position: position, image: image, audio: audio )
end


Client.create( id: 2000, name: "mary")


ActiveRecord::Base.connection.reset_pk_sequence!('items')

Item.create( id: 2000, name: "I feel", client_id: 2000 , position: 1)
feel_list = [
    [2001, "Angry", 2000, 5, "angry.png", nil],
    [2002, "Frustrated", 2000, 4, "frustrated.png", nil],
    [2004, "Scared", 2000,  2, "scared.png", nil],
    [2005, "Happy", 2000,  1, "happy.png", nil],
    [2006, "Tired", 2000,  6, "tired.png", nil],
    [2007, "Sad", 2000,  7, "sad.png", nil]
]

feel_list.each do |id, name, parent, position, image_path, audio_path|
  image = File.read("app/assets/images/#{image_path}")
  Item.create( id: id, client_id: 2000 , name: name, parent_id: parent, position: position, image: image, audio: audio )
end

hurt_list = [
    [2003, "Hurt", 2000,  3, "hurt.png", nil],
]

Item.create( id: 3000, name: "I hurt", client_id: 2000 , position: 1)
hurt_list.each do |id, name, parent, position, image_path, audio_path|
  image = File.read("app/assets/images/#{image_path}")
  Item.create( id: id, client_id: 2000 , name: name, parent_id: parent, position: position, image: image, audio: audio )
end