# Wikeez is a place for you to share Wikis written in Markdown

Here's the link: [wikeez.herokuapp.com](http://wikeez.herokuapp.com)

You can sign up to post your wikis publicly, or privately with paid access.

## The Build

This project was my second application that focused on backend work with Ruby on Rails. Just like [Linkit](https://github.com/aizkhaj/linkit), this one is also hosted on Heroku with a PostgreSQL database. A lot of the frontend elements are also done with Bootstrap UI.

In terms of functionality, here's some of what I packed into this app:

* User authentication and authorization rules with Devise and Pundit gems.

* Markdown functionality in all text areas that are part of input forms.

* Stripe integration for payment processing to allow Premium users.

* Ability for Premium users to create private wikis and add collaborators (even standard, public users that sign up for free).

This project was also built with TDD in mind. RSpec unit tests are in place for models and controllers.