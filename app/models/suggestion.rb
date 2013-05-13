# == Schema Information
#
# Table name: suggestions
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  author          :string(255)
#  title           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  suggestion_type :string(255)
#

class Suggestion < ActiveRecord::Base
  attr_accessible :author, :name, :title, :suggestion_type

  validates :name,  presence: true, length: { maximum: 50 }
  validates :author, presence: true
  validates :title, presence: true
  validates :suggestion_type, presence: true

end
