# README

# About this App Moyoshi

[![Image from Gyazo](https://i.gyazo.com/31ac599b9e0235f9bc8428fbd45626f6.jpg)](https://gyazo.com/31ac599b9e0235f9bc8428fbd45626f6)
[![Image from Gyazo](https://i.gyazo.com/ff78f180e87316fe6542c5f0a5432b7d.jpg)](https://gyazo.com/ff78f180e87316fe6542c5f0a5432b7d)


## URL 

https://www.moyoshi.me/

### 既存ユーザー

|name|email|password|
|------|----|-------|
|taro|t1@taro.com|taro123|
|jiro|te2@jiro.com|jiro123|
|ichiro|tes3@ichiro.com|ichiro1|
|saburo|test4@saburo.com|saburo1|



### 企画背景: 

Moyoshi = 催し

このアプリは、催し事やイベントを掲載したり告知したりする掲示板アプリです。

地域のお得情報やイベント情報、個人が開催するワークショップ等を、その地域に住む人や、
その地域を訪れた人に知ってもらいたいと思いこのアプリを作りました。



実装済機能
- ログイン機能
- 投稿機能 
- いいね機能
- コメント機能
- タグ機能
- 検索機能(キーワード検索、タグ検索、現在地から検索)

今後実装予定の機能
- UI/UXの改善
- ユーザー編集ページの充実
- フォローフォロワー機能

等々。。

# Usage
 

登録　➡️　投稿　➡️　いいねorコメントor検索

### 実装機能 
- ログイン機能
- 投稿機能 
- いいね機能
- コメント機能
- タグ機能
- 検索機能




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

