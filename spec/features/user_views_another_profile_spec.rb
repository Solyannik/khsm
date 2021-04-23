require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.feature 'USER views another profile', type: :feature do
  let(:user_1) { FactoryBot.create(:user, name: 'user_1') }
  let(:user_2) { FactoryBot.create(:user, name: 'user_2') }
  let!(:games) {[
    FactoryBot.create(
        :game,
        user_id: user_1.id,
        current_level: 5,
        created_at: Time.parse('2021.04.23, 15:00'),
        finished_at: Time.parse('2021.04.23, 15:30'),
        fifty_fifty_used: true,
        prize: 1000
    ),

    FactoryBot.create(
        :game,
        user_id: user_1.id,
        prize: 32000,
        current_level: 10,
        created_at: Time.parse('2021.04.23, 16:00'),
        finished_at: Time.parse('2021.04.23, 16:30'),
        is_failed: true
    )
  ]}

  before(:each) do
    login_as user_2
  end

  scenario 'anonim views user profile' do
    visit "/users/#{user_1.id}"
    
    # 1я игра
    expect(page).to have_content games[0].id
    expect(page).to have_content 'деньги'
    expect(page).to have_content '23 апр., 16:00'
    expect(page).to have_content '5'
    expect(page).to have_content '1 000'
    expect(page).to have_content '50/50'

    # 2я игра
    expect(page).to have_content games[1].id
    expect(page).to have_content '23 апр., 17:00'
    expect(page).to have_content '10'
    expect(page).to have_content '32 000'
    expect(page).to have_content '50/50'

    expect(page).not_to match 'Сменить имя и пароль'
  end
end
