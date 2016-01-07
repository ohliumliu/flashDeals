class HomepageController < ApplicationController
  def index
    @catalogs = Catalog.all
    @merchants = Merchant.all
    @travel_sites = TravelSite.all
    @products = Product.order('percentage_saved DESC')
  end
end
