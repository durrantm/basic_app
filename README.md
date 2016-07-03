# basic_app

This is the framework template for a rspec-capybara project
It can be used to start testing any publicly available web site.

Prerequisites:

- Ruby should be installed.
  I prefer RVM -https://rvm.io/  
  `\curl -sSL https://get.rvm.io | bash`

- Install bundler to manage your gems (components added to your basic ruby install)
  http://bundler.io/  
  `gem install bundler`

- Clone this repo  
  - `git clone https://github.com/durrantm/basic_app`

- Use bundler to install the gems:
  - `cd basic_app`
  - `bundle`

- To run all the tests:

  - bundle exec rspec spec
