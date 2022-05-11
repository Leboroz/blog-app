# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
generate_lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
title = %w[Gossip Chat Blog Rails Ruby Milestone Portfolio]

User.create(name: 'Tom',
            photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxM[…]G90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: 'Teacher from Mexico.', email: 'tom@gmail.com', password: 'tom12345', confirmed_at: DateTime.now)
User.create(name: 'Lilly',
            photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxM[…]G90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', bio: 'Teacher from Poland.', email: 'lily@gmail.com', password: 'lily12345')

Post.create(author: User.first, title: 'Hello1', text: 'This is my first post')
Post.create(author: User.first, title: 'Hello2', text: 'This is my second post')
Post.create(author: User.first, title: 'Hello3', text: 'This is my third post')
Post.create(author: User.first, title: 'Hello4', text: 'This is the fourth post')


Comment.create(post: Post.first, author: User.first, text: 'Hi Lisandro!')
Comment.create(post: Post.first, author: User.first, text: 'Hi Sahar!')
Comment.create(post: Post.first, author: User.first, text: 'Hi Andres!')
Comment.create(post: Post.first, author: User.first, text: 'Hi Nicolas!')
Comment.create(post: Post.first, author: User.first, text: 'Hi Reem!')
Comment.create(post: Post.first, author: User.first, text: 'Hi Other People!')

Like.create(post: Post.first, author: User.first)
Like.create(post: Post.second, author: User.first)
