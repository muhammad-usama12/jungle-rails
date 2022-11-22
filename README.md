# Jungle

### A mini e-commerce application built with Rails 6.1. The site displays distinct features (gems) provided by Rails which were implmeneted to create a comprehensive experience of using a conventional e-commerce site.

## App Screencaps

!["Homepage"](https://github.com/muhammad-usama12/jungle-rails/blob/master/docs/app-homepage.png)

Jungle Homepage

!['Product List'](https://github.com/muhammad-usama12/jungle-rails/blob/master/docs/app-product-page.png)

Product List Page

!['Product Cards'](https://github.com/muhammad-usama12/jungle-rails/blob/master/docs/app-product-cards.png)

Product Cards (shows if a product is out of stock)

!['Admin Login'](https://github.com/muhammad-usama12/jungle-rails/blob/master/docs/app-admin-permission.png)

Admin Login Required via HTTP Authetication

!['Admin Feature'](https://github.com/muhammad-usama12/jungle-rails/blob/master/docs/app-admin-feature.png)

Admin Privilege provides store states and product management section

!["Empty Cart Page"](https://github.com/muhammad-usama12/jungle-rails/blob/master/docs/app-empty-cart-page.png)

Empty Cart with a link for users to head back and add something

!["Cart with Products"](https://github.com/muhammad-usama12/jungle-rails/blob/master/docs/app-cart-page.png)

Cart with Products

!["Order Confirmation Page"](https://github.com/muhammad-usama12/jungle-rails/blob/master/docs/app-order-confirmation-page.png)

Order Confirmation Page

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Tests

- RSpec
- Cypress

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
