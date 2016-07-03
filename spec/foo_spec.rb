require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://www.google.com'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


describe 'Loads up correctly', :type => :feature do
  before :each do
    Capybara.current_driver = :chrome
  end
  describe "For Google pages" do

    before :each do
      root='/'
    end
    it 'Has the expected search input field' do
      visit( @root )
      search_button_on_page=find(:css, "input[aria-label='Search']")
      expect(search_button_on_page).to be_true
    end

    it 'Shows results' do
      visit( @root )
      find(:css, "input[aria-label='Search']").set("123")
      expect(page).to have_content 'results'
    end
  end

  describe 'For weather.com pages', :type => :feature do

    before :each do
      @http = page.driver.browser.send(:bridge).http.instance_variable_get(:@http)
      @http.read_timeout = 120
    end
    after :each do
      @http.read_timeout = 60
    end
    it 'Can then visit weather.com' do
      visit( 'http://www.weather.com' )
      expect(page).to have_content('WEATHER')
    end

    it 'Can see a search box at weather.com' do
      visit( 'http://www.weather.com' )
      expect(page).to have_selector('input')
    end

  end
end
