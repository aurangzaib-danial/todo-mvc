users = [
  {email: 'sunny@khan.com', password: 'khan1234'},
  {email: 'avi@fs.com', password: 'avi1234'},
  {email: 'jay@dota.com', password: 'jay1234'},
]

User.create!(users)

sunny = User.first
avi = User.second
jay = User.third

list_1 = sunny.personal_lists.create!(title: 'Learning Rails')
list_1.collaborator_lists.create!(collaborator: avi)

list_2 = avi.personal_lists.create!(title: 'Things to teach')
list_2.collaborator_lists.create!([{collaborator: sunny}, {collaborator: jay}])

list_3 = jay.personal_lists.create!(title: 'Learning Dota')
list_3.collaborator_lists.create!({collaborator: sunny})
