class Account::DistributorPaymentsController < ApplicationController

  def index
    @pending_payments = current_user.payments.pending
    @payed_payments = current_user.payments.payed

  end

end