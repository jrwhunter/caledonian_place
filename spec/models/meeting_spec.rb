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

require 'spec_helper'

describe Meeting do
  pending "add some examples to (or delete) #{__FILE__}"
end
