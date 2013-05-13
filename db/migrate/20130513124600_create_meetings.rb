class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.date :date
      t.string :venue
      t.string :author
      t.string :title

      t.timestamps
    end
  end
end

