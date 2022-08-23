class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :edit, :update]
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to public_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdtaw
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
  
end
