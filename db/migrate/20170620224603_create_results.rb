class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.belongs_to :search, foreign_key: true
      t.text :content

      t.timestamps
    end
    add_index :results, :content
  end
end
