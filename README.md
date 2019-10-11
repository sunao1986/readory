# README

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

book_reviews
  t.string :review_title, null: false
  t.text :review
  t.integer :rate
  t.string :book_title
  t.string :author
  t.string :image_url
  t.text :detail
  t.integer :isbn
  t.references :user, foreign_key: true
  t.timestamps

  belongs_to :user

books（消去）
  t.string :title
  t.string :image_url
  t.string :author
  t.text :detail
  t.timestamps

  hasmany :reviews
  hasmany :book_users
  has_many :users, through: :book_users

reviews（消去）
  t.string :title, null: false
  t.text :review 
  t.integer :rate
  t.references :book, foreign_key: true
  t.references :user, foreign_key: true
  t.timestamps

  belongs_to :book
  belongs_to :user

book_users(消去)
  t.references :book, foreign_key: true
  t.references :user, foreign_key: true
  t.timestamps

  belongs_to :book
  belongs_to :user

users (追記)
  t.string :name, null: false, unique: true, index: true
  t.string :image_url
  t.text :introduction, index: true

  has_many :reviews
  has_many :book_users
  has_many :books, through: :book_users   