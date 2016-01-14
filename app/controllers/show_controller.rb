class ShowController < ApplicationController
  def show
    if params[:catalog_id]
      @products = Product.where(catalog_id: params[:catalog_id]).order('percentage_saved DESC')
    elsif params[:merchant_id]
      @products = Product.where(merchant_id: params[:merchant_id]).order('percentage_saved DESC')
    elsif params[:search]
      @products = Product.where('title LIKE ?', "%#{params[:search]}%")
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
end
