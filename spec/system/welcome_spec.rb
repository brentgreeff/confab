RSpec.describe "Welcome", type: :system do
  before { driven_by :selenium_headless }

  scenario 'View homepage', js: true do
    visit '/'
    expect(find('h1')).to have_content 'Welcome'
  end
end
