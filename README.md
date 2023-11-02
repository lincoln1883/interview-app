# Fabricut Developer Take Home Test

Hey, thanks for your interest in working for Fabricut!

This repo is designed to be a take home test to give you a chance to work through some problems on a small part of our code. Like much of our codebase, this is code that has been evolved over years, and it has tons of opportunities for improvement. We want to see how you approach updating, refactoring, or even rewriting parts of the code as you see fit. It gives us a chance to see how you solve problems and it gives _you_ a chance to see some of the challenges we face in our legacy codebase.

### Here's how it works:

1. **Set aside about four hours to work on this.** The goal isn't to fix _all_ the problems, but to show us what you think are the most important changes that could be made in a limited amount of time. (This is true for most projects—we rarely have unlimited time to make things perfect.) Start by forking this repo and getting it set up on your machine.
2. **Work through some of the problems below.** It's up to you what problems you choose to solve. You can pick one, or try to do a bit of all of them. Any approach is valid as long as it shows us how you work and how you think.
3. **Do your own thing.** The tasks below are just guidelines. If you review the code and see something that sticks out to you, feel free to work on that. Just make sure it still gives us a good feel for your work.
4. **Send it back to us.** Give us access to your fork so we can see your changes. We'll go through the commits you make and try to understand the thinking behind them. We may have some questions for you in a follow up interview!

### Getting set up

You need:

* A working Ruby 3 setup (see [`.ruby-version`](.ruby-version) for the exact version).
* PostgreSQL (any recent version should be fine)

With those things in place, run:

```sh
git clone git@github.com:fabricut/interview-app.git
cd interview-app
bundle

# To set up the database and load the seed data:
bin/rails db:prepare

# To start the development server:
bin/dev
```

The app should be running at http://localhost:3000/products.

## Things you might work on:

- [X] Refactor the [`ApiController#stock_and_pricing`](app/controllers/api_controller.rb#L4) action.
- [X] Refactor the [`PricingHelper#pricing_html`](app/helpers/pricing_helper.rb#L4) helper.
- [ ] Remove the need for [`Rails.ajax`](app/javascript/controllers/product_stock_controller.js#L35), possibly using [Turbo](https://turbo.hotwired.dev).
- [ ] Improve the Stimulus controller to be more generic and reusable. Maybe it should be split up.
- [ ] Add tests, especially if you refactor the pricing logic in the [`Product`](app/models/product.rb) model.
- [ ] Work through fixing some RuboCop checks that are ignored in [`.rubocop_todo.yml`](.rubocop_todo.yml).

Bonus UI points:

- [X] Change the font to Lato.
- [X] Make the layout look nicer and work on mobile.

## Things to keep in mind:

- Again, **don't try to do everything**. Show us what you think matters most.
- There's no right answers. Some of this code is taken right out of a production app. We haven't fixed it yet either!
- This is set up as a Rails 7 app using [import maps](https://github.com/rails/importmap-rails) and [Tailwind CSS](https://github.com/rails/tailwindcss-rails). This isn't the setup we're working with currently, but it's our goal.
- Some code is mocked or stubbed just for this test app. We've tried to mark those sections with a comment.
- There are a few integration tests and a few Rails system tests. Definitely make sure those continue to pass and feel free to add more!
