describe 'User with no permissions' do
  before do
    visit new_user_session_path
    fill_in :user_email, with: 'mark@m.com'
    fill_in :user_password, with: 'mark1234'
    click_button 'Sign in'
  end

  let(:error_message) { 'You are not authorized to access this page.'}

  it 'cannot view someone else list ' do
    visit list_path(List.first)
    expect(page.body).to include(error_message)
  end

  
end
