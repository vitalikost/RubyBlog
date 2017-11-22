class Answer < ApplicationRecord
  has_many :users,dependent: :destroy
  belongs_to :question
end
