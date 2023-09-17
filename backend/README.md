## Setup VS Code

Install recommended VS Code plugins (`.vscode/extensions.json`).

Add the following code snippet to `settings.json`.

```
  "[ruby]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "rebornix.ruby"
  },
  "ruby.useLanguageServer": true,
  "ruby.format": "standard",
  "ruby.lint": {
    "standard": true
  },
  "files.associations": {
    "*.erb": "erb"
  },
  "[erb]": {
    "editor.defaultFormatter": "manuelpuyol.erb-linter",
    "editor.formatOnSave": true
  }
```

## Setup development on MacOS

```
# ubuntu: sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev
brew install rbenv # ubuntu: curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
rbenv install 3.2.0
brew install postgresql
bundle install
```

## Start development

```
./bin/rails db:migrate
./bin/dev
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
bin/rails generate scaffold Asset name:string state:integer description:text lot_number:string amount_in_kg:decimal{7.3} attachments:attachments images:attachments ingredient:references
bin/rails generate scaffold BatchStep name:string description:text asset:references batch:references
bin/rails active_storage:install
```

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
