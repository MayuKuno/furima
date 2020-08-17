class ProductsController < ApplicationController
  def index
    @products = Product.includes(:pictures).order('created_at DESC')
  end

  def new
    if user_signed_in?
      @product = Product.new
      @product.pictures.new
      @category_parent_array =  Category.where(ancestry: nil) do |parent|
        @category_parent_array << parent
      end
    else
      redirect_to root_path
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to products_path
    else
      @category_parent_array =  Category.where(ancestry: nil) do |parent|
        @category_parent_array << parent
      end
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    grandchild_category = @product.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path , notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path
  end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  private
  def product_params
    params.require(:product).permit(:price, :name, :explanation, :brand, :condition, :preparationdays, :prefecture_id, :is_shipping_buyer, :category_id, pictures_attributes: [:image, :destroy, :id]).merge(user_id: current_user.id, saler_id: current_user.id)
  end
end



  
