class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: "Product was successfully created."
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    @item.update(item_params)

    if @item.save
      redirect_to items_path, notice: "Product was updated."

    else
      render :edit
    end
  end

  def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to items_path, notice: 'Product was deleted'

  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :price
    )
  end

end
