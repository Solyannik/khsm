require 'rails_helper'

RSpec.describe 'users/show', type: :view do

  let(:game) { FactoryBot.build_stubbed(:game) }
  let(:user) { FactoryBot.create(:user, name: 'Ольга') }

  context 'viewed by non-current user' do
    before(:each) do
      assign(:user, user)

      render
    end

    it 'renders user name' do
      expect(rendered).to match 'Ольга'
    end

    it 'doesnt render change password button' do
      expect(rendered).not_to match 'Сменить имя и пароль'
    end

    it 'renders game partial' do
       render partial: 'game', object: game
    end
  end

  context 'viewed by current user' do
    before(:each) do
      assign(:game, game)
      assign(:user, user)

      sign_in user

      render
    end

    it 'renders change password button' do
      expect(rendered).to match 'Сменить имя и пароль'
    end
  end
end
