class AddIndexToToken < ActiveRecord::Migration[5.1]
  def change
  	add_index :searches, :token, unique: true
  end
end
