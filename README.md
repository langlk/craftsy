# Specialty Food Site

### _Epicodus Project in Ruby on Rails, December 1, 2017_

### By Kelsey Langlois

## Description

_This is a mock website for an online craft store. It has basic user authentication, so that only logged in users may review products, and only administrators can create, edit, and delete products._

## Installation and Setup

To install on your own machine, follow the instructions below:

* Clone this repository.
* Run the following commands in the project root directory:
  ```
  cd flickr_clone
  bundle update
  rake db:setup
  rails serve
  ```
* Open ```localhost:3000``` in your web browser
* **To give an account admin privileges:**
  * In the project root run ```rails c```
  * In the rails console, run:
  ```ruby
  User.find_by(email: "[account email address]").update(admin: true)
  ```
  * The account will now have admin access to the app.

## Specifications

* Unauthenticated users may:
  * View all products
  * View product details
  * View product reviews
* Authenticated users may do all of the above as well as:
  * Create reviews
  * Edit and delete their own reviews
* Authenticated admins may do all of the above as well as:
  * Create, edit, and delete products.
  * Delete user reviews.

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Bootstrap
* Devise
* Paperclip

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*
