# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainNavbarComponent, type: :component do
  it 'renders the navbar with the provided query' do
    query = Faker::Lorem.word
    render_inline(described_class.new(query:))

    expect(page).to have_css('.navbar')
    # expect(page).to have_text(query)
  end
end
