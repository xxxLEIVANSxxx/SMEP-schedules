class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  layout 'main'


  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    respond_to do |format|
      if @payment.schedule.user.can_schedule?
        @payment.status = "true"    
        
        if @payment.save
          Schedule.find(@payment.schedule_id).update(status: "true")
          format.html { redirect_to schedules_url, notice: 'Payment was successfully created.' }
          format.json { render @payment, status: :created, location: @payment }
        else
          format.html { redirect_to schedules_url, notice: 'Unable to pay.' }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to schedules_url, notice: 'You already have two current appointments.' }
        format.json { render json: @payment, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:schedule_id, :form, :value)
    end
end
