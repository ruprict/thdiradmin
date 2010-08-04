class SaleItemsController < ActionController::Base
  
  def index
    @sale_items = SaleItem.all
    
    respond_to do |format|
      format.html 
      format.xml {render :xml => @sale_items}
    end
  end
  
end
