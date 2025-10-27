RSpec.describe "User", type: :system do
  before { driven_by :selenium_headless }
  # before { create(:project) }
  let!(:user) { create(:user) }

  scenario "Signs in", js: true do
    visit "/"

    expect(find("h1")).to have_content "Sign in"

    fill_in "email_address", with: user.email_address
    fill_in "password", with: "password"
    click_on "Sign in"

    expect(page).to have_content "Successfully signed in!"
    # expect(find("h1")).to have_content "Feed"
  end

  scenario "Password not correct", js: true do
    visit "/"

    expect(find("h1")).to have_content "Sign in"

    fill_in "email_address", with: "brent@example.com"
    fill_in "password", with: "not correct"
    click_on "Sign in"

    expect(page).to have_content "Try another email address or password."
  end
end
