class Spree::Admin::FeaturedProductsController < Spree::Admin::ResourceController

  before_action :set_featured_product, only: [:show, :edit, :update, :destroy]
  before_action :load_stores, only: [:new, :edit]

  def index
    @featured_products = Spree::FeaturedProduct.all
  end

  def show
  end

  def new
    @featured_product = Spree::FeaturedProduct.new
    @products = Spree::Product.all
  end

  def edit
    @products = Spree::Product.all
  end

  def create
    @featured_product = Spree::FeaturedProduct.new(featured_product_params)
    respond_to do |format|
      if @featured_product.save
        flash[:success] = Spree.t(:create, scope: [:featured_products])
        format.html { redirect_to spree.admin_featured_products_url }
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @featured_product.update_attributes(featured_product_params)
        flash[:success] = Spree.t(:update, scope: [:featured_products])
        format.html { redirect_to spree.admin_featured_products_url }
      else
        render :edit
      end
    end
  end

  private

  def set_featured_product
    @featured_product = Spree::FeaturedProduct.find params[:id]
  end

  def load_stores
    @stores = Store.order(:name)
  end

  def featured_product_params
    params.require(:featured_product).permit(:name, :product_id)
  end
end