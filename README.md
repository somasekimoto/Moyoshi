# README

# Moyoshi DB 設計

## users table 
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|username|string|null: false, index: true|
|password|string|null: false|
|password_confirmation|string|null: false|

### association
- has_many :posts
- has_many :comments

## posts table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|
|image|string|
|user|references|null: false, foreign_key: true|
|comment|references|foreign_key: true|

### association
- belongs_to :user
- has_many :comments
- has_many :genres, through: :posts_genres

## comments table 
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null; false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|

### association
- belongs_to :user
- belongs_to :post


## genres table
|Column|Type|Options|
|------|----|-------|
|genre|text|null: false|
|post|references|foreign_key: true|

### association
- has_many :posts_genres
- has_many :posts, through: :posts_genres

## posts_genres table
|Column|Type|Options|
|------|----|-------|
|post|references|null: false, foreign_key: true|
|genre|references|null: false, foreign_key: true|

### association
- belongs_to :post
- belongs_to :genre

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
