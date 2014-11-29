# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# Top level items: ID, name, position
#
item_list = [
  [ 1, "Food", 2, "i_admin.png" ],
  [ 2, "TV", 3, "i_admin.png" ],
  [ 3, "pool", 4, "i_admin.png" ],
  [ 4, "Computer", 1, "i_admin.png" ]
]

item_list.each do |id, name, position, image_path|
  image = File.read("app/assets/images/#{image_path}")
  Item.create( id: id, name: name, position: position, image: image )
end


# Second level items: ID, name, parent, position
#
children_item_list = [
  [ 5, "biscuit", 1, 1, "biscuit.jpg" ],
  [ 6, "bread", 1, 2, "bread.jpg" ],
  [ 7, "breadsticks", 1, 3, "breadsticks.jpg" ],
  [ 8, "dinner", 1, 4 , "dinner.jpg"],
  [ 9, "lollies", 1, 5, "lollies.jpg" ],
  [ 10, "pink biscuit", 1, 6, "pinkbiscuit.jpg" ],
  [ 11, "rice cakes", 1, 7, "ricecrackers.jpg" ],
  [ 12, "nutella toast", 1, 8, "toast.jpg"],


  [ 13, "Barney", 2, 1, "i_admin.png" ],
  [ 14, "Brainy Baby", 2, 2, "i_admin.png" ],
  [ 15, "Elmo", 2, 3, "i_admin.png" ],
  [ 16, "Giggle Bellies", 2, 4, "i_admin.png" ],
  [ 17, "Hi-5", 2, 5, "i_admin.png" ],
  [ 18, "music", 2, 6, "i_admin.png" ],
  [ 19, "Wiggles", 2, 7, "i_admin.png" ],

  [ 20, "Elmo and I know it", 4, 1,"i_admin.png" ],
  [ 21, "Gangnam Style", 4, 2, "i_admin.png" ],
  [ 22, "Giggle Bellies", 4, 3, "i_admin.png" ],
  [ 23, "Hi-5", 4, 4, "i_admin.png" ],
  [ 24, "One Direction", 4, 5, "i_admin.png" ]
]

children_item_list.each do |id, name, parent, position, image_path|
  image = File.read("app/assets/images/#{image_path}")
  Item.create( id: id, name: name, parent_id: parent, position: position, image: image )
end

ActiveRecord::Base.connection.reset_pk_sequence!('items')