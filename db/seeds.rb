# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

user_fiorina = User.create!({username: "Fiorina", password_digest: "1234"})
user_trump = User.create!({username: "Trump", password_digest:"5678"})
user_carson = User.create!({username: "Carson", password_digest: "abcd"})
user_clinton = User.create!({username: "Clinton", password_digest: "efgh"})

user_fiorina.create_profile!({
  gender: "female", 
  birth_year: 1954, 
  first_name: "Carly", 
  last_name: "Fiorina"})
user_trump.create_profile!({
  gender: "male", 
  birth_year: 1946, 
  first_name: "Donald", 
  last_name: "Trump"})
user_carson.create_profile!({
  gender: "male", 
  birth_year: 1951, 
  first_name: "Ben", 
  last_name: "Carson"})
user_clinton.create_profile!({
  gender: "female", 
  birth_year: 1947, 
  first_name: "Hillary", 
  last_name: "Clinton"})

one_year_from_today = Date.today + 1.year

fiorinas_todo_list = user_fiorina.todo_lists.create!({
  list_name: "Carly's to-do list", 
  list_due_date: one_year_from_today})
trumps_todo_list = user_trump.todo_lists.create!({
  list_name: "Donald's to-do list", 
  list_due_date: one_year_from_today})
carsons_todo_list = user_carson.todo_lists.create!({
  list_name: "Ben's to-do list", 
  list_due_date: one_year_from_today})
hillarys_todo_list = user_clinton.todo_lists.create!({
  list_name: "Hillary's to-do list", 
  list_due_date: one_year_from_today})

todo_lists = [fiorinas_todo_list, trumps_todo_list, carsons_todo_list, hillarys_todo_list]

todo_lists.each do |list|
  first_name = list.user.profile.first_name
  5.times do |i|
    list.todo_items.create!({
      due_date: one_year_from_today, 
      title: "#{first_name} item #{i+1}", 
      description: "#{first_name} item #{i+1} description", 
      completed: false})
  end
end