class Account::HomeDistributorController < ApplicationController

  def index
    @amount_pending_payments  = Money.new(current_user.payments.pending.sum(:amount_in_cents))
    @amount_payed_payments    = Money.new(current_user.payments.payed.sum(:amount_in_cents))

  end

end
