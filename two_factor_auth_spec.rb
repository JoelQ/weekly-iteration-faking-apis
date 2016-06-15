feature "signing in" do
  scenario "with two factors" do
    create(:user, password: "password", email: "user@example.com")

    visit root_path
    click_on "Sign In"

    fill_in :email, with: "user@example.com"
    fill_in :password, with: "password"
    click_on "Submit"

    last_message = FakeSMS.messages.last
    fill_in :code, with: last_message.body
    click_on "Submit"

    expect(page).to have_content("Sign out")
  end
end
