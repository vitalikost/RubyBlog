# == Schema Information
#
# Table name: userlikes
#
#  id          :integer          not null, primary key
#  id_user     :integer
#  id_question :integer
#  like        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class UserlikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
