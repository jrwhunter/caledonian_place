class AddSuggestionTypeToSuggestion < ActiveRecord::Migration
  def change
    add_column :suggestions, :suggestion_type, :string
  end
end
