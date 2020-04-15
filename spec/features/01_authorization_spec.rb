describe 'Basic Routes' do
  it 'works' do
    visit root_path
    expect(page.status_code).to eq(200)
  end
end
