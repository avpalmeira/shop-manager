class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index
    count = @products.count
    response.set_header('Content-Range', count.to_s)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    code = user_signed_in? ?
      helpers.get_affiliate_code(@product, current_user) : ''

    product = {
      :name => @product.name,
      :quantity => @product.quantity,
      :code => code
    }
    render json: product, status: :ok
  end

  # POST /products
  # POST /products.json
  def create
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render json: @product, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { render json: @product }
    end
  end

  def decode
    code = params[:code]
    decoded_info = { :info => helpers.decode_affiliate_code(code) }
    render json: decoded_info, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_product
    #   @product = Product.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :quantity, :photo)
    end
end
