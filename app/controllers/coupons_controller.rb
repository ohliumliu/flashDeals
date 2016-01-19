class CouponsController < ApplicationController
  def submit_deal
    deal = Coupon.new
    deal[:content] = params[:submitDeal]
    deal.save

    respond_to do |format|
      format.html # index.html.erb
      format.text { render text: "Thank you for submitting a deal" }
    end

  end
end
