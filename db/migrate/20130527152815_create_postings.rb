class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :author
      t.string :content

      t.timestamps
    end
  end
end
