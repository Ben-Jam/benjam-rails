class Item < ActiveRecord::Base
  has_many :children, class_name: "Item",
                          foreign_key: "parent_id"
 
  belongs_to :parent, class_name: "Item"

  belongs_to :client

  ROOT='I want...'

  def self.root
    Item.where("name = ?",ROOT).first 
  end
end
