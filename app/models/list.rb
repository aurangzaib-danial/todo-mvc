class List < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  
  belongs_to :user

  validates_presence_of :title
end
