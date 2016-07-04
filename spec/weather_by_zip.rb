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
search_input = "input[name='search']"
search_button = "div.icon--search"

describe 'Looks up weather for locations by zip code', :type => :feature do
  before :each do
    Capybara.current_driver = :chrome
    Capybara.default_wait_time = 120
  end
  it 'Has the expected input field for weather by location' do
    visit( root )
    find_weather_by_location = find( search_input )
    expect( find_weather_by_location ).to be
  end
  it 'Looks up the location for 02140' do
    visit( root )
    find( search_input ).set('02140')
    sleep 2
    find( search_button ).click
    expect(page).to have_content 'Cambridge'
  end
  it 'Looks up the weather for Cambridge' do
    visit( root )
    find( search_input ).set('02140')
    sleep 2
    find( search_button ).click
    sleep 2
    find( "ul.cities li a")
    find("ul.cities li a").click
    expect(page).to have_content 'Cambridge'
  end

end
