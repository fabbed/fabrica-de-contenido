class PaymentsController < ApplicationController



  def mark_as_payed

    @payment = Payment.find(params[:id])
    @payment.mark_as_payed

    flash[:notice] = "Markeado como pagado, la comisión esta en su cuenta"

    @payed_payments = current_user.payments.payed    

    respond_to do |wants|
      wants.js do
        render :partial => "mark_as_payed"
      end
      wants.html { redirect_to :controller => "account/distributor_payments"}
    end
    
  end


end
