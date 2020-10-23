class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index
    filter_products(params)
    range_products(params, response)
  end

  # GET /products/1
  # GET /products/1.json
  def show
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
    
    # Filter products by given keys and values
    def filter_products(params)
      if params[:filter] != "{}" #TODO: use a more generic conditional
        filter = JSON.parse(params[:filter])
        filter.each do |property, value|
          @products = @products.select do |product|
            product[property].to_s.include? value
          end
        end
      end
    end

    # Set the range of the products shown
    def range_products(params, resp)
      format_range = "*"
      total = @products.count
      if params[:range] && !params[:range].empty?
        range = JSON.parse(params[:range])
        if ((range.is_a? Array) && range.size == 2)
          @products = @products[range[0]..range[1]]
          format_range = "#{range[0]+1}-#{range[1]+1}" 
        end
      end
      content_range = "products #{format_range}/#{total.to_s}"
      resp.set_header('content-range', content_range)
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.permit(:name, :quantity, :photo)
    end
end
