# Domain Model

User has many lists
User has many collaborator_lists
User has many shared_lists through collaborator_lists

List belongs to a user
List has many collaborator_lists
List has many collaborators through collaborator_lists
List has many tasks

Collaborator List belongs to a user
Collaborator List belongs to a list

Task belongs to a List
