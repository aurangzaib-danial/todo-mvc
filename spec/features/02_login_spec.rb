
describe 'Log in' do

  before do
    User.create(email: 'sunny@example.com', password: 'khan1234')
  end

  it 'user can successfully log in' do    
    visit login_path

    fill_in 'email', with: 'sunny@example.com'
    fill_in 'password', with: 'khan1234'

    click_button 'Log in'

    expect(page.body).to include('sunny@example.com')
  end
end
