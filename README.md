##### Weightlifintg Forum
This rails project is a forum with Weightlifting as its dominant flavor. Users can create accounts, either manually or registering through Google, as well as create their own forums, comment on existing forums, and search and filter all forums. Notable features include filtering different categories, Users having the option to close forums that they have created, and Users having the ability to signup with a Profile Photo.

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.3](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [6.1.4](https://github.com/organization/project-name/blob/master/Gemfile#L12)

##### 1. Check out the repository


https://github.com/ShamiTomita/forum


##### 2. Bundle Install Gems

Bundle and install gems

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
