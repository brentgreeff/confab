RSpec.describe "Visitor", type: :system do
  before { driven_by :selenium_headless }

  scenario "Registers", js: true do
    visit "/"

    expect(find("h1")).to have_content "Sign in"

    click_on "Register"

    expect(find("h1")).to have_content "Sign up"

    fill_in "user_email_address", with: "brent@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_on "Sign up"

    expect(page).to have_content "Successfully signed in!"
    # expect(find("h1")).to have_content "Feed"
  end

  scenario "Passwords don't match", js: true do
    visit "/"
    click_on "Register"

    expect(page).to have_content "Sign up", wait: 3

    fill_in "user_email_address", with: "brent@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "doesnt match"
    click_on "Sign up"

    expect(page).to have_content "Error creating your user account!"
  end
end
