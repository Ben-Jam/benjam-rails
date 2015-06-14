class AddClientReferanceToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :client, index: true
  end
end
