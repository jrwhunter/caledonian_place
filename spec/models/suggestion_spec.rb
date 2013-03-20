# == Schema Information
#
# Table name: suggestions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  author     :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Suggestion do
  pending "add some examples to (or delete) #{__FILE__}"
end
