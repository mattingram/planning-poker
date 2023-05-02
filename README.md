# Planning-Poker app built on Ruby Hotrails Turbo

Inspired by: https://www.hotrails.dev/turbo-rails

### Steps to recreate your own from scratch:

- `rails new planning-poker --css=sass --javascript=esbuild --database=postgresql`
- `bin/rails generate model Room name:uuid`
    - Modify room.rb and add `validates :name, presence: true`
    - Modify migration and add `null: false` to the uuid column
- `bin/rails db:migrate`
- `bin/rails generate controller Home`
- `bin/rails generate controller Rooms`
