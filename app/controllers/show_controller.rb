class ShowController < ApplicationController
  def show
    initialize_lists
    if params[:catalog_id]
      @products = Product.where(catalog_id: params[:catalog_id]).order('percentage_saved DESC')
    elsif params[:merchant_id]
      @products = Product.where(merchant_id: params[:merchant_id]).order('percentage_saved DESC')
    elsif params[:search]
      @products = Product.where('title LIKE ?', "%#{params[:search]}%")
      respond_to do |format|
        format.html {render :partial => "show"} # index.html.erb
        #format.html {render :partial => "show", :locals => {:products => @products}} # index.html.erb
        #format.html {render partial: "show", locals: {products: @products}}# index.html.erb
        #format.html {render partial: "show", object: @products}# index.html.erb
        format.json {render text: "Thank you for submitting a deal"}
      end

    else
      @products = Product.order('percentage_saved DESC')
    end
  end

  def list_catalogs
    @catalogs = Catalog.all
  end

  def list_merchants
    @merchants = Merchant.all
  end

  def initialize_lists
    @merchants = Merchant.all
    @catalogs = Catalog.all
    @travel_sites = TravelSite.all
  end
end
