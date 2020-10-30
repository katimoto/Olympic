module SignInSupport
  def sign_in(user)
    visit root_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on('Log in')
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
  end
end
