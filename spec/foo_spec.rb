require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://www.weather.com'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

root='/'
login_page = "http://profile.weather.com/#/login"

describe 'Loads up correctly', :type => :feature do
  before :each do
    Capybara.current_driver = :chrome
    #Capybara.default_wait_time = 120
  end
  it 'Has the expected login field' do
    visit( root )
    login_button_on_page=find("span.login")
    expect(login_button_on_page).to be
  end
  it 'Allows a login to fail' do
    visit ( login_page )
    fill_in('email', with: 'm2@snap2web.com')
    fill_in('password', with: 'blobbyblobby')
    find('button#LogInBtn').click
    expect(page).to have_selector 'form#loginForm'
  end

end
