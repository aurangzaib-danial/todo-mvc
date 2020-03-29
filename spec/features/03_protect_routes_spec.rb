describe 'Protecting Routes' do

  context 'after logged in' do

    before do

      User.create(email: 'sunny@example.com', password: 'khan1234')

      visit login_path

      fill_in(:email, with: 'sunny@example.com')
      fill_in(:password, with: 'khan1234')

      click_button 'Log in'
    end

    it 'cannot access signup' do
      visit signup_path

      expect(current_path).to eq(root_path)
    end

    it 'cannot access login' do
      visit login_path

      expect(current_path).to eq(root_path)
    end

    it 'cannot access a list if it does not belong to the logged in user' do
      user1 = User.find_by_email('sunny@example.com')

      user2 = User.create(email: 'avi@fs.com', password: 'coolboy1234')
      list = user2.lists.create(title: 'this is cool')

      visit list_path(list)

      expect(current_path).to eq(root_path)
    end
  end

  context 'when logged out' do
    before do
      user = User.create(email: 'sunny@example.com', password: 'khan1234')

      user.lists.create(title: 'groceries')
    end

    it 'cannot access a list' do
      visit list_path(List.first)

      expect(current_path).to eq(root_path)
    end


  end

end
