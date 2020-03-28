class List < ApplicationRecord
  has_many :tasks
  
  belongs_to :user

  validates_presence_of :title
end
