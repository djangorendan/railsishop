class EtcController < ApplicationController
  layout "admin", only: :admin_page
  def admin_page; end
end
