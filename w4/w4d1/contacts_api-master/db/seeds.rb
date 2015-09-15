# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(username: 'User One')
user2 = User.create!(username: 'User Two')
user3 = User.create!(username: 'User Three')

contact1 = Contact.create!(name: 'Gerald', email: 'gerald@email.com', user_id: user1.id)
contact2 = Contact.create!(name: 'Frank', email: 'gerald2@email.com', user_id: user2.id)
contact3 = Contact.create!(name: 'Gerald3', email: 'gerald3@email.com', user_id: user3.id, favorite: true)
contact4 = Contact.create!(name: 'Gerald4', email: 'gerald4@email.com', user_id: user1.id)
contact5 = Contact.create!(name: 'Gerald5', email: 'gerald5@email.com', user_id: user1.id)

ContactShare.create!(user_id: user1.id, contact_id: contact3.id)
ContactShare.create!(user_id: user1.id, contact_id: contact2.id)

group1 = Group.create!(user_id: user1.id, name: "Gerald")
ContactGroup.create!(group_id: group1.id, contact_id: contact4.id)
ContactGroup.create!(group_id: group1.id, contact_id: contact5.id)

comment = Comment.create(commentable_id: user1.id,
                         commentable_type: "#{user1.class}",
                         body: "omg comments",
                         author_id: user2.id)
