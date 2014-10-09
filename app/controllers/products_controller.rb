class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comments = Comment.where(product_id = @product.id)
    raise
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def edit
    @categories = Category.all
    @product = Product.find(params[:id])
  end

  def create
    # this is the equivalent of a var dumpo for my form data
    #render :text => params.inspect
    @product = Product.new(product_params)
    # attempt to save pug to database
    if @product.save
      flash[:success] = 'New product succesfully created'
      redirect_to products_path
    else
      @errors = @product.errors.full_messages
      @categories = Category.all
      render :new
    end
  end

  def update
   #raise
    @product = Product.find(params[:id])
    # render :text => params.inspect
    if @product.update(product_params)
      flash[:message] = "product updated succesfully"
      redirect_to product_path(@product)
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
      @product = Product.find(params[:id])
    if @product.delete
      flash[:message] = "Product DELETED succesfully"
      redirect_to products_path
    else
      flash[:message] = "Product CANNOT be deleted"
      redirect_to products_path
    end
  end



  private

  def product_params
    params.require(:product).permit(:name, :description, :pricing, :category_id)
  end

  def set_product
      #this runs every time we need it to automatically before the action
      @product= Product.find(params[:id])
  end

end
