class CollaboratorList < ApplicationRecord
  belongs_to :collaborator, class_name: 'User'
  belongs_to :list
  validates :collaborator, uniqueness: { scope: :list, message: 'Already Shared!'}

  attr_reader :collaborator_email
  before_validation :add_collaborator_using_email

  def add_collaborator_using_email
    if collaborator_email.present?
      if list.creator.email != collaborator_email
        self.collaborator = User.find_by_email(collaborator_email)
      end
    end
  end

  def collaborator_email=(email)
    @collaborator_email = email.try(:downcase)
  end
end
