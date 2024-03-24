require 'rails_helper'

RSpec.describe 'pages/home.html.erb', type: :view do
  it 'displays the correct title' do
    render

    expect(rendered).to have_selector('div.container')
    expect(rendered).to have_content(I18n.t('views.home.title'))
  end
end
