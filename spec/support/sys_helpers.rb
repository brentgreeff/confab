module SysHelpers
  def login(user)
    visit "/"

    expect(find("h1")).to have_content "Sign in"

    fill_in "email_address", with: user.email_address
    fill_in "password", with: "password"
    click_on "Sign in"

    expect(find("h1")).to have_content "Feed"
  end
end
