RSpec.describe "Stats", type: :system do
  before { driven_by :selenium_headless }
  before { create(:project, name: "Original") }

  let(:user) { create(:user) }
  before { login(user) }

  scenario "Changes project", js: true do
    visit "/"
    click_on "Stats"
    expect(find("h1")).to have_content "Stats"
  end
end
