describe 'Collaborator' do
  before do
    login('avi@fs.com', 'avi1234')
  end

  it 'can view a list if associated as a collaborator of the list' do
    list = List.first
    visit list_path(list)
    expect(page.body).to include(list.title)
  end
  
end
