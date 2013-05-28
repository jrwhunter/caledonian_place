class Posting < ActiveRecord::Base
  attr_accessible :author, :content

  validates :author,  presence: true, length: { maximum: 50 }
  validates :content,  presence: true, length: { maximum: 250 }

end
