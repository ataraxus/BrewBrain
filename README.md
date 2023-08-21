## Setup development on MacOS

```
brew install rbenv
rbenv install 3.2.0
brew install postgresql
bundle install
```

## Start development

```
bin/dev
```

## Commands for scaffold model

```
bin/rails generate scaffold User name:string
bin/rails generate scaffold FormulaCategory name:string description:text
bin/rails generate scaffold Formula name:string description:text state:integer images:attachments attachments:attachments
bin/rails generate scaffold FormulaStep name:string description:text formula:references
bin/rails generate scaffold Ingredient name:string description:text type:integer images:attachments attachments:attachments
bin/rails generate scaffold FormulaIngredient ingredient:references percentage: decimal formula:references
bin/rails generate scaffold Batch name:string description:text state:integer finished:boolean amount:integer images:attachments attachments:attachments
bin/rails generate scaffold Comment user:references text:text reference:references{polymorphic} attachments:attachments
bin/rails generate scaffold ExecutedStep name:string state:integer executed_at:timestamp user:references batch:references process_step:references
bin/rails generate scaffold Resource name:string state:integer description:text lot_number:string amount_in_kg:decimal{7.3} attachments:attachments images:attachments ingredient:references
bin/rails generate scaffold BatchStep name:string description:text resource:references batch:references
```



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
