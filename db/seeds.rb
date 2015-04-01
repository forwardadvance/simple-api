# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

Author.destroy_all
Author.reset_pk_sequence
Article.destroy_all
Article.reset_pk_sequence
Comment.destroy_all
Comment.reset_pk_sequence

dave = Author.create first_name: "Dave", surname: "Ramsay", email: "dave@example.com", about: "Awesome Dave"
mike = Author.create first_name: "Mike", surname: "McKeen", email: "mike@example.com", about: "Magnificent Mike"

article = Article.create title: "All about Dave", author: mike, intro: "Dave Rocks"
article = Article.create title: "Angular is Cool", author: mike, intro: "I really like Angular"

comment = Comment.create article: article, name: "Phil", email: "phil@example.com", website: "http://www.example.com", content: "I love Dave so much"
comment = Comment.create article: article, name: "Terrence", email: "terry@example.com", website: "http://www.example.com", content: "Angular is the best!"
