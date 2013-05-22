class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.integer :story_id
      t.integer :author_id
      t.string :content
      t.integer :length

      t.timestamps
    end
  end
end
