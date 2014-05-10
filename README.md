Myapp
=========
## help

    # create moudle
    bundle exec rails generate scaffold –¼‘O [ƒJƒ‰ƒ€–¼:Œ^]

    # create db migration
    bundle exec rails g db:migration user
    bundle exec rake db:migate
    bundle exec rails g migration add_avatar_to_users avatar:string

    # change erb/html to yaml
    bundle exec rake haml:replace_erbs

    bundle exec rails g kaminari:config
    bundle exec rails g kaminari:views  bootstrap

    # to production
    bundle exec rake db:migrate RAILS_ENV=production

    # minify
    bundle exec rake assets:precompile RAILS_ENV=production

## attention

* restart production server when js and css sass is changed
