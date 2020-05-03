require 'rails_helper'

RSpec.describe ListPolicy, type: :policy do
  subject { described_class.new(user, list_1) }
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
  let(:user_3) { create(:user) }
  let(:list_1) { user_1.personal_lists.create!(title: 'Learning Rails') }
  let(:actions) { %i[show destroy sharing] }

  context 'List owner' do
    let(:user) { user_1 }
    it { is_expected.to permit_actions(actions)}
  end

  context 'User with a shared list' do
    let(:user) { user_2 }
    before(:each) do
      list_1.collaborator_lists.create!(collaborator: user_2)
    end

    it { is_expected.to permit_action(:show)}
    it { is_expected.to forbid_actions([:destroy, :sharing])}
  end

  context 'User with nothing shared' do
    let(:user) { user_3 }
    it { is_expected.to forbid_actions(actions)}
  end
end
