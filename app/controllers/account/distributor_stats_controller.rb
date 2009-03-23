class Account::DistributorStatsController < ApplicationController


  def index
    @payments = current_user.payments
  end


end
