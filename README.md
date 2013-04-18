## Friend Get Friend Demo App

_Live coded with the enthusiastic support of the the nzruby/christchurch group_

## Bash history

I've expanded my shortcuts in the list below.
I have `HISTCONTROL=ignoredups:erasedups` so only the last time a ran a command is recorded below.


```
[2013-04-18 19:35:37]: rails new friend-get-friend --skip-bundle
[2013-04-18 19:35:50]: cd friend-get-friend
[2013-04-18 19:35:54]: git init
[2013-04-18 19:36:06]: rails server
[2013-04-18 19:38:11]: rake db:create
[2013-04-18 19:38:53]: heroku create
[2013-04-18 19:42:35]: rails generate rspec:install
[2013-04-18 19:42:58]: rspec
[2013-04-18 19:52:18]: rails generate model Entry name:string email:string
[2013-04-18 20:06:00]: rails generate migration AddUniquenessIndexToEntries
[2013-04-18 20:06:42]: rake db:reset
[2013-04-18 20:12:13]: rails generate migration AddCodeToEntries code:string
[2013-04-18 20:22:30]: rspec -fd spec/helpers/entries_helper_spec.rb 
[2013-04-18 20:26:37]: rails generate migration AddReferrerIdToEntries referrer_id:integer
[2013-04-18 20:35:09]: heroku run rake db:migration

# Break

[2013-04-18 21:13:40]: rspec -fd spec/features/visitor/sign_up_spec.rb 
[2013-04-18 21:38:13]: bundle
[2013-04-18 21:45:01]: rails generate migration AddWinnerToEntries winner:boolean[A
[2013-04-18 21:45:13]: rake db:migrate db:test:prepare
[2013-04-18 21:45:41]: rspec -fd spec/models/entry_spec.rb 
[2013-04-18 21:58:54]: rspec -fd spec/features/admin/manage_entries_spec.rb 
[2013-04-18 22:00:04]: rake
[2013-04-18 22:00:14]: rake stats
[2013-04-18 22:00:32]: git push heroku master
[2013-04-18 22:01:50]: heroku run rake db:migrate
```