class HomepageController < ApplicationController
  def index
    @catalogs = Catalog.all
    @merchants = Merchant.all
    @travel_sites = TravelSite.all
  end
end
