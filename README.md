# Projeto
  - Ruby on rails `Desafio Umanni`
  - Postgres
  - webpack
  - stimulus


# Start:


## Local
> First of all remember to run Bundle and Yarn to install all gems and frameworks

> Do not forget about the DB too (rails db:create db:migrate db:seed)

```sh
# run local machine
$ bundle install

$ npm install

# remember config database IN confi/database.ymal
$ rails db:create db:migrate db:seed

$ rails assets:precompile
```

# Using Docker




# Test using login user

> Some Logins already exist for use
- <b> Login-Admin </b> :axelpatton@gmail.com <br>
- Password: demo123 <br>
- <b> Login-User: </b> samuel_eto@umanni.com.br <br>
- Password: demo123 <br>

### How it works:

> Visitor
- Has access to the home page
- Can register yourself like normal user

> User
- Can access to the home page
- Can access your profile and see, edit or delete it

> Administrator
- Can access home page
- Can access your profile and view, edit or delete it
- Can access Dashboard with all user manager statistics
- Can access all user profiles and edit or delete them
- Can turn other user as admin as well
- Can import a spreadsheet with new users to the system

## 🤝 Developer
 - Axel Alexander



bundle install


rails db:setup



rails assets:precompile


brew install libpq
brew link --force libpq
bundle install