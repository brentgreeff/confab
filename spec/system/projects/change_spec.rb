RSpec.describe "Visitor", type: :system do
  before { driven_by :selenium_headless }
  before { create(:project, name: "Original") }

  let(:user) { create(:user) }
  before { login(user) }

  scenario "Changes project", js: true do
    click_on "Edit project"
    expect(find("h1")).to have_content "Edit current project"

    fill_in "Name", with: "New name"
    click_on "Update"

    expect(page).to have_content "Project updated!"
    expect(page).to have_selector("tr.notification", count: 1)

    expect(find(".notification .message").text).to eq(
      'Name changed from "Original" to "New name"',
    )
    expect(find(".notification .author").text).to eq(user.email_address)
  end

  scenario "Forgets name", js: true do
    click_on "Edit project"
    expect(find("h1")).to have_content "Edit current project"

    fill_in "Name", with: ""
    click_on "Update"

    expect(page).to have_content "Name can't be blank"
  end
end
