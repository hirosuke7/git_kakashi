class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy ]

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def new
    @customer= Customer.new
  end

  def create
    @customer= Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path
    else
      # バリデーションがNGならばエラーメッセージを設定
      # errors.full_messagesの中にエラーメッセージが設定されています。
      flash.now[:alert] = @customer.errors.full_messages
      # 入力画面を表示
      render :new
    end
  end

    def update
      @customer.update(customer_params)
      redirect_to customers_path
    end

    def destroy
      @customer.destroy
      redirect_to customers_path
    end

    private

    def set_customer
      @customer= Customer.find(params[:id])
    end

    def customer_params
     params.require(:customer).permit(
      :family_name,
      :given_name,
      :email
      )
  end
end
