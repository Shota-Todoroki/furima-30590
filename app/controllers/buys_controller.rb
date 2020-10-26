class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_root_path, only: [:index]

  def index 
    @user_buy = UserBuy.new
    @product = Product.find(params[:product_id])
  end
  
  def create
    @product = Product.find(params[:product_id])
    @user_buy = UserBuy.new(buy_params)
    if @user_buy.valid?
      pay_product
      @user_buy.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_root_path
    @product = Product.find(params[:product_id])
    binding.pry
    if user_signed_in? && current_user.id != @product.user.id
      if @product.buy.presence #ルーティングでネストしてbuysはproductsの子要素なので、buysテーブルを出力させたい時はこのような記述になる。
        redirect_to root_path
      end
    end
  end

  def buy_params
    params.require(:user_buy).permit(:postal_code, :region_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id],token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # ENV["PAYJP_SECRET_KEY"]は自身のPAY.JPテスト秘密鍵を代入した環境変数。
    Payjp::Charge.create(
      amount: @product[:price],    # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
