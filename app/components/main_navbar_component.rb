# frozen_string_literal: true

# Navbar component that displays a search form
class MainNavbarComponent < ViewComponent::Base
  def initialize(query:) # rubocop:disable Lint/MissingSuper
    @query = query
  end
end
