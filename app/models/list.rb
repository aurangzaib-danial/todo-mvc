class List < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :collaborator_lists, dependent: :destroy
  has_many :collaborators, through: :collaborator_lists

  has_many :tasks, dependent: :delete_all

  validates_presence_of :title
end
