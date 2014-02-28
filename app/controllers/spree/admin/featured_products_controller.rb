class Spree::Admin::FeaturedProductsController < Spree::Admin::ResourceController

  before_action :set_featured_product, only: [:show, :edit, :create, :update, :destroy]
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
    @products = Spree::Product.by_store(@featured_product.store_id)
  end

  def create
    @featured_product = Spree::FeaturedProduct.new(featured_product_params)
    respond_to do |format|
      if @featured_product.save
        flash[:success] = Spree.t(:create, scope: [:featured_products])
        format.html { redirect_to spree.edit_admin_featured_product_path(@featured_product) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @featured_product.update_attributes(featured_product_params)
        flash[:success] = Spree.t(:update, scope: [:featured_products])
        format.html { redirect_to spree.edit_admin_featured_product_path(@featured_product) }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_featured_product
    @featured_product = Spree::FeaturedProduct.find params[:id]
  end

  def load_stores
    @stores = Spree::Store.order(:name)
  end

  def featured_product_params
    params.require(:featured_product).permit(:name, :product_id, :store_id)
  end
end