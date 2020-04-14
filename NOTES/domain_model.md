# Domain Model

User has many lists
User has many contributor_lists
User has many shared_lists through contributor_lists

List belongs to a user
List has many contributor_lists
List has many contributors through contributor_lists
List has many tasks

Contributor List belongs to a user
Contributor List belongs to a list


Task belongs to a List
