# The Harvest Ruby Gem

A Ruby interface to the Harvest API.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Installation](#installation)
  - [Gemfile](#gemfile)
  - [Standalone](#standalone)
- [Configuration](#configuration)
- [Usage](#usage)
  - [Users](#users)
    - [Current](#current)
    - [List](#list)
    - [Find](#find)
    - [Create](#create)
    - [Update](#update)
    - [Delete](#delete)
    - [Current Project Assignments](#current-project-assignments)
    - [Project Assignments](#project-assignments)
  - [Clients](#clients)
    - [List](#list-1)
    - [Find](#find-1)
    - [Create](#create-1)
    - [Update](#update-1)
    - [Delete](#delete-1)
  - [Contacts](#contacts)
    - [List](#list-2)
    - [Find](#find-2)
    - [Create](#create-2)
    - [Update](#update-2)
    - [Delete](#delete-2)
- [TODOs](#todos)
  - [models](#models)
  - [misc](#misc)
- [Contributing](#contributing)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installation

### Gemfile

```ruby
gem 'harvest'
```

### Standalone

```
gem install harvest
```

## Configuration

```ruby
harvest = Harvest::Connection.new do |config|
  config.access_token = "YOUR_ACCESS_TOKEN"
  config.account_id   = "YOUR_ACCOUNT_ID"
end
```

## Usage

After configuring the harvest connection, you can do the following things.

### Users

Full parameter documnetation can be found at
+ [https://help.getharvest.com/api-v2/users-api/users/users/](https://help.getharvest.com/api-v2/users-api/users/users/)
+ [https://help.getharvest.com/api-v2/users-api/users/project-assignments/](https://help.getharvest.com/api-v2/users-api/users/project-assignments/)

#### Current

```ruby
harvest.user

```

#### List

<details><summary>Options</summary><p>

```ruby
options = {
  is_active: true, # boolean
  updated_since: Date.today.prev_month, # datetime
  page: 1, # integer
  per_page: 5 # integer
}
```
</p></details><br>


```ruby

harvest.users(options)

```

#### Find

```ruby
harvest.user(user.id)

```

#### Create

<details><summary>Options</summary><p>

```ruby
options = {
  first_name: "Test", # REQUIRED - string
  last_name: "User", # REQUIRED - string
  email: "test.user@your-domain", # REQUIRED - string
}
```
</p></details><br>

```ruby

harvest.user_create(options)

```

#### Update

```ruby
options = {
  last_name: "User-Updated"
}

harvest.user_create(user.id, options)

```

#### Delete

```ruby
harvest.user_delete(user.id)

```

#### Current Project Assignments

```ruby
harvest.user_project_assignments

```

#### Project Assignments

<details><summary>Options</summary><p>

```ruby
options = {
  page: 1, # integer
  per_page: 5 # integer
}
```
</p></details><br>

```ruby
harvest.user_project_assignments(user.id, options)

```

### Clients

Full parameter documentation can be found at
+ [https://help.getharvest.com/api-v2/clients-api/clients/clients/](https://help.getharvest.com/api-v2/clients-api/clients/clients/)
+ [https://help.getharvest.com/api-v2/clients-api/clients/contacts/](https://help.getharvest.com/api-v2/clients-api/clients/contacts/)

#### List

<details><summary>Options</summary><p>

```ruby
options = {
  is_active: true, # boolean
  updated_since: Date.today.prev_month, # datetime
  page: 1, # integer
  per_page: 5 # integer
}
```
</p></details><br>

```ruby

harvest.clients(options)

```

#### Find

```ruby
harvest.client(client.id)

```

#### Create

<details><summary>Options</summary><p>

```ruby
options = {
  name: "Test Client", # REQUIRED - string
}
```
</p></details><br>

```ruby
harvest.client_create(options)

```

#### Update

<details><summary>Options</summary><p>

```ruby
options = {
  name: "Test Client Updated" # string
}
```
</p></details><br>

```ruby
harvest.client_update(client.id, options)

```

#### Delete

```ruby
harvest.client_delete(client.id)

```

### Contacts

Full parameter documentation can be found at
+ [https://help.getharvest.com/api-v2/clients-api/clients/contacts/](https://help.getharvest.com/api-v2/clients-api/clients/contacts/)

#### List

<details><summary>Options</summary><p>

```ruby
options = {
  is_active: true, # boolean
  updated_since: Date.today.prev_month, # datetime
  page: 1, # integer
  per_page: 5 # integer
}
```
</p></details><br>

```ruby

harvest.contacts(options)

```

#### Find

```ruby
harvest.contact(contact.id)

```

#### Create

```ruby
options = {
  client_id: client.id, #	REQUIRED
  first_name: "Test",	#	REQUIRED
}

harvest.contact_create(options)

```

#### Update

```ruby
options = {
  first_name: "Test Updated"
}

harvest.contact_update(contact.id, options)

```

#### Delete

```ruby
harvest.contact_delete(contact.id)

```























## TODOs

### models

- [ ] invoices
- [ ] estimates
- [ ] expenses
- [ ] tasks
- [ ] timesheets
- [ ] projects
- [ ] roles

### misc

- [ ] all the things
- [ ] clean up api/request
- [ ] add tests
- [ ] model relations
- [ ] set attribute data types

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/phiction/harvest.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
