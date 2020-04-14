class CollaboratorList < ApplicationRecord
  belongs_to :collaborator, class_name: 'User'
  belongs_to :list
end
