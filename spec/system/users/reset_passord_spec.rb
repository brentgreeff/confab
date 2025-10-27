RSpec.describe "User", type: :system do
  before { driven_by :selenium_headless }
  before { create(:project) }
  let!(:user) { create(:user) }

  xscenario "Resets password", js: true do
    expect(find("h1")).to have_content "Sign in"

    click_on "Forgot password?"
  end
end
