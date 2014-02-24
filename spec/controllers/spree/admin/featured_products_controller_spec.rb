require 'spec_helper'

describe Spree::Admin::FeaturedProductsController do
  stub_authorization!

  let(:valid_attributes) { { product: create(:product), store_id: create(:store).id } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Spree::ItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all spree_featured_products as @featured_products" do
      featured_product = Spree::FeaturedProduct.create! valid_attributes
      spree_get :index, valid_session
      assigns(:featured_products).should eq([featured_product])
    end

    it "renders the index template" do
      spree_get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns the requested spree_featured_product as @featured_product" do
      featured_product = Spree::FeaturedProduct.create! valid_attributes
      spree_get :show, {:id => featured_product.to_param}, valid_session
      assigns(:featured_product).should eq(featured_product)
    end
  end

  describe "GET new" do
    it "assigns a new spree_featured_product as @featured_product" do
      spree_get :new, {}, valid_session
      assigns(:featured_product).should be_a_new(Spree::FeaturedProduct)
    end
  end

  describe "GET edit" do
    it "assigns the requested spree_featured_product as @featured_product" do
      featured_product = Spree::FeaturedProduct.create! valid_attributes
      spree_get :edit, {:id => featured_product.to_param}, valid_session
      assigns(:featured_product).should eq(featured_product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Spree::FeaturedProduct" do
        expect {
          spree_post :create, {:featured_product => valid_attributes}, valid_session
        }.to change(Spree::FeaturedProduct, :count).by(1)
      end

      it "assigns a newly created spree_featured_product as @featured_product" do
        spree_post :create, {:featured_product => valid_attributes}, valid_session
        assigns(:featured_product).should be_a(Spree::FeaturedProduct)
        assigns(:featured_product).should be_persisted
      end

      it "redirects to the created spree_featured_product" do
        featured_product = Spree::FeaturedProduct.create! valid_attributes
        spree_post :create, {:featured_product => featured_product.attributes}, valid_session
        response.should redirect_to spree.edit_admin_featured_product_path(assigns(:featured_product))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spree_featured_product as @featured_product" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spree::FeaturedProduct.any_instance.stub(:save).and_return(false)
        spree_post :create, {:featured_product => { product_id: 1 }}, valid_session
        assigns(:featured_product).should be_a_new(Spree::FeaturedProduct)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spree::FeaturedProduct.any_instance.stub(:save).and_return(false)
        spree_post :create, {:featured_product => { store_id: nil }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested spree_featured_product" do
        featured_product = Spree::FeaturedProduct.create! valid_attributes
        # Assuming there are no other spree_items in the database, this
        # specifies that the Spree::Item created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Spree::FeaturedProduct.any_instance.should_receive(:update_attributes).with({ "product_id" => "2" })
        spree_put :update, {:id => featured_product.to_param, :featured_product => { product_id: 2 }}, valid_session
      end

      it "assigns the requested spree_featured_product as @featured_product" do
        featured_product = Spree::FeaturedProduct.create! valid_attributes
        spree_put :update, {:id => featured_product.to_param, :featured_product => valid_attributes}, valid_session
        assigns(:featured_product).should eq(featured_product)
      end

      it "redirects to the featured_product edit" do
        featured_product = Spree::FeaturedProduct.create! valid_attributes
        spree_put :update, {:id => featured_product.to_param, :featured_product => valid_attributes}, valid_session
        response.should redirect_to(spree.edit_admin_featured_product_path(featured_product))
      end
    end

    describe "with invalid params" do
      it "assigns the spree_featured_product as @featured_product" do
        featured_product = Spree::FeaturedProduct.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Spree::FeaturedProduct.any_instance.stub(:save).and_return(false)
        spree_put :update, {:id => featured_product.to_param, :featured_product => { product: build(:product) }}, valid_session
        assigns(:featured_product).should eq(featured_product)
      end

      it "re-renders the 'edit' template" do
        featured_product = Spree::FeaturedProduct.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Spree::FeaturedProduct.any_instance.stub(:save).and_return(false)
        spree_put :update, {:id => featured_product.to_param, :featured_product => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested spree_featured_product" do
      featured_product = Spree::FeaturedProduct.create! valid_attributes
      expect {
        spree_delete :destroy, {:id => featured_product.to_param}, valid_session
      }.to change(Spree::FeaturedProduct, :count).by(-1)
    end

    it "redirects to the spree_items list" do
      featured_product = Spree::FeaturedProduct.create! valid_attributes
      spree_delete :destroy, {:id => featured_product.to_param}, valid_session
      response.should redirect_to(spree.admin_featured_products_url)
    end
  end
end