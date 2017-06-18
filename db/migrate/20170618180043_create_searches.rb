class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.date :from_date
      t.date :to_date
      t.string :email
      t.string :encrypted_password
      t.string :token

      t.timestamps
    end
  end
end
