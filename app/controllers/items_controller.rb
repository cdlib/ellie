class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # # PATCH/PUT /items/1
  # # PATCH/PUT /items/1.json
  # def update
  #   respond_to do |format|
  #     if @item.update(item_params)
  #       format.html { redirect_to @item, notice: 'Item was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @item }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params[:item]
    end
end
