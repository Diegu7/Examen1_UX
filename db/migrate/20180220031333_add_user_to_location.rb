class AddUserToLocation < ActiveRecord::Migration[5.1]
  def change
  	add_reference :locations, :user, foreing_key: true
  end
end
