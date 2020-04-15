class List < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :collaborator_lists, dependent: :destroy
  has_many :collaborators, through: :collaborator_lists

  has_many :tasks, dependent: :delete_all

  validates_presence_of :title

  def collaborator_lists_with_collaborators
    collaborator_lists.includes(:collaborator)
  end

  def has_at_least_one_collaborator?
    collaborator_lists.any?
  end

  def is_shared_with?(user)
    collaborator_lists.exists?(collaborator: user)
  end
end
