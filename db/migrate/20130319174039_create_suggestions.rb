class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :name
      t.string :author
      t.string :title

      t.timestamps
    end
  end
end
