# README

# About this App Moyoshi

[![Image from Gyazo](https://i.gyazo.com/3a9f856a63d2c9ee2b711b7c395e0770.jpg)](https://gyazo.com/3a9f856a63d2c9ee2b711b7c395e0770)


Moyoshi = 催し



このアプリは、催し事やイベントを掲載したり告知したりする掲示板アプリです。

現在進行形で、アプリ改善中です。
- UI/UXの改善
- 地域別に掲載情報を変更するため、googlemapAPIの導入
- ユーザーページ作成

等々。。

# Usage
 

登録　➡️　投稿　➡️　いいね

### 実装機能 
- ログイン機能
- 投稿機能 
- いいね機能
- コメント機能
- タグ機能
- 検索機能


### 既存ユーザー

|name|email|password|
|------|----|-------|
|taro|t1@taro.com|taro123|
|jiro|te2@jiro.com|jiro123|
|ichiro|tes3@ichiro.com|ichiro1|
|saburo|test4@saburo.com|saburo1|

- URLはこちら http://18.176.131.168/









# Database

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
- has_many :likes, dependent: :destroy
- has_many :like__posts, through: :likes, source: :post

## posts table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|
|image|string|
|likes_count|integer||
|user|references||

### association
- acts_as_taggable
- acts_as_taggable_on :genres
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liking_users, through: :likes, source: :user

## comments table 
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|bigint|foreign_key: true|
|post_id|bigint|foreign_key: true|

### association
- belongs_to :user
- belongs_to :post


## likes table 
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreign_key: true|
|post_id|bigint|null: false, foreign_key: true|

### association
- belongs_to :post, counter_cache: :likes_count
- belongs_to :user

## tags table
|Column|Type|Options|
|------|----|-------|
|name|string|collation: "utf8_bin"|
|taggings_count|integer|default: 0|

### association
None

## taggings table
|Column|Type|Options|
|------|----|-------|
|tag_id|integer||
|taggable_type|string||
|taggable_id|integer||
|tagger_type|string||
|tagger_id|integer||
|context|string|limit: 128|

### association
None

