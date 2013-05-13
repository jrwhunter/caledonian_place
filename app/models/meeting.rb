# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  date       :date
#  venue      :string(255)
#  title      :string(255)
#  author     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Meeting < ActiveRecord::Base
  attr_accessible :author, :date, :title, :venue

  validates :date,  presence: true
  validates :venue, presence: true,  length: { maximum: 50 }
  validates :title, presence: true
  validates :author, presence: true

before_save :parse_date_string
def parse_date_string
  my_date = Date.strptime(date,  '%d/%m/%Y') if date.is_a? String
end
end
