describe 'List Authorization' do
  before do
    visit new_user_session_path
    fill_in :user_email, with: 'mark@m.com'
    fill_in :user_password, with: 'mark1234'
    click_button 'Sign in'
  end

  context 'Simple User' do
    it 'cannot view someone else list ' do
      expect(page.body).to include('mark@m.com')
    end
  end
  
end
