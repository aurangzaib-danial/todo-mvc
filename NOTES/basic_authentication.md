# Basic Auth TODO

- [x] Switch from sqlite3 to postgres
- [x] Sign up page and redirect to root page
- [x] Setup login page
- [x] User has many lists
- [ ] Protect your routes
- [ ] Push to heroku


Must use following
- Capybara

## Sign up page and redirect to root page

In terms of database, I have to create a users table. A user has an email and a password digest

In terms of URL, I have to create a /signup route and link it UsersController new action. Also, post to /signup route and link to create action of UsersController.

## Protect routes

/signup
/login
