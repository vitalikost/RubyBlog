# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  like       :integer
#

class   Question < ApplicationRecord
  has_many :answers,dependent: :destroy
    validates :title, presence: true,
            length: { minimum: 5 }
end
