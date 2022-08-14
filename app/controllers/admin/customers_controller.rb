class Admin::CustomersController < ApplicationController
  def index
    @customers=Customer.all
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  private
  
  def customers_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:encrypted_password,:postal_code,:address,:telephone_number,:is_active)  
  end
  
end
