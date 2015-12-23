class HomepageController < ApplicationController
  def index
    @catalogs = Catalog.all
    @merchants = Merchant.all
  end
end
