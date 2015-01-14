require 'barby'
require 'barby/barcode/ean_13'
require 'barby/outputter/html_outputter'


class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.all
    

  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @buy = Buy.find(params[:buy_id])
    @coupon = @buy.build_coupon(:user_id => @buy.member.id, :customer_id => @buy.customer.id,:price => @buy.get_total_price, :barcode => sprintf('%012d', @buy.id))

    respond_to do |format|
      if @coupon.save
          @barcode = Barby::EAN13.new(@coupon.barcode)
          @buy.update(status: 1)
          @coupon.update(end_date: @coupon.created_at + 30.days, :barcode_read => @barcode.to_s)
        flash[:success] = "Muy Bien!! El cupón de descuento ha sido generado exitosamente, ahora está listo para ser impreso."
        format.html { redirect_to @buy}
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: 'Coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_url, notice: 'Coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
      params.require(:coupon).permit(:end_date, :barcode, :user_id, :customer_id, :price, :buy_id, :state)
    end
end
