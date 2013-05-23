class AddRecordDataToSentence < ActiveRecord::Migration
  def change
    add_column :sentences, :record_path, :string
  end
end
