RSpec.describe "Visitor", type: :system do
  before { driven_by :selenium_headless }
  before { create(:project) }

  let(:user) { create(:user) }
  before { login(user) }

  scenario "Leaves a comment", js: true do
    expect(find("h1")).to have_content "Feed"

    fill_in "Comment", with: "What version of Ruby?"
    click_on "Add"

    expect(page).to have_content "New comment added!"
    expect(page).to have_selector("tr.notification", count: 1)

    expect(find(".notification.new .message").text).to eq(
      "What version of Ruby?",
    )
    expect(find(".notification.new .author").text).to eq(user.email_address)
  end

  scenario "Forgets to leave a comment", js: true do
    expect(find("h1")).to have_content "Feed"

    fill_in "Comment", with: ""
    click_on "Add"

    expect(page).to have_content "Error adding comment"
  end
end
