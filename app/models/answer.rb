# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  commenter   :string
#  body        :text
#  question_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :question
end
