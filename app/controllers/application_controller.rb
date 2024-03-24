class ApplicationController < ActionController::Base
  before_action :set_default_meta_tags
  include(ActionView::Helpers::AssetUrlHelper)
  include CableReady::Broadcaster

  private

  def set_default_meta_tags
    set_meta_tags site: I18n.t('meta_tags.site')
  end
end
