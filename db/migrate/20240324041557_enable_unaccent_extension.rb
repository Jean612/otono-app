# frozen_string_literal: true

# enable_extension 'unaccent'
class EnableUnaccentExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'unaccent'
  end
end
