class Item < ActiveRecord::Base
  has_many :children, class_name: "Item",
                          foreign_key: "parent_id"
 
  belongs_to :parent, class_name: "Item"

  ROOT='root'

  def self.root
    Item.where("name = ?",ROOT).first 
  end
end
