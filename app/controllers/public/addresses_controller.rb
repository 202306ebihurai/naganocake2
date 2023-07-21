class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配送先を登録しました。"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      flash[:notice] = "情報に不備があります。"
      render :index
    end
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先を更新しました。"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      render :edit
    end
  end

  def destroy
    @address = current_customer.addresses.find(params[:id])
    @address.destroy
    flash[:notice] = "配送先を削除しました。"
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postcode, :address, :receiver)
  end

end
