describe 'Sign Up' do
  it 'a user can sign up' do
    
    visit signup_path

    fill_in(:user_email, with: 'sunny@example.com')
    fill_in(:user_password, with: 'khan1234')
    fill_in(:user_password_confirmation, with: 'khan1234')
    
    click_button 'Sign Up'

    expect(page.body).to include('sunny@example.com')
  end

end
