class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create, :update, :destroy]

  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    candle = Candle.find(params[:candle_id])
    @line_item = @cart.add_candle(candle)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to candle, notice: "Item added to bag." }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    if params[:quantity_adjust] == 'increase'
      @line_item.quantity += 1
    elsif params[:quantity_adjust] == 'decrease' && @line_item.quantity > 1
      @line_item.quantity -= 1
    elsif @line_item.quantity <= 1
      @line_item.destroy
      respond_to do |format|
        format.html { redirect_to cart_path(@cart), notice: "Item was successfully removed from bag." }
        format.json { head :no_content }
      end
      return
    end

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to cart_path(@cart), notice: "Quantity updated."}
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: "Item was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:candle_id, :quantity)
    end
end
