class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :author_id
      t.string :title
      t.date :publish_date
      t.date :complete_date
      t.boolean :active

      t.timestamps
    end
  end
end
