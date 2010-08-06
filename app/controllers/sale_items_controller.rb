class SaleItemsController < ApplicationController
  
  def index
    @sale_items = SaleItem.all
    
    respond_to do |format|
      format.html 
      format.xml {render :xml => @sale_items}
    end
  end
  
  def new
    @sale_item = SaleItem.new(params[:sale_item])
  end
  
  def edit
    @sale_item = SaleItem.find(params[:id])
    
  end
  
  def create
    @sale_item = SaleItem.new(params[:sale_item])
    
    respond_to do |format|
      if @sale_item.save
        format.html {redirect_to sale_items_path, :notice => "Sale item successfully created"}
        format.xml {render :xml => @sale_item, :status=>:created, :location=>@sale_item}
      else
        format.html { render :new}
        format.xml {render :xml => @sale_item.errors, :status=>:unprocessible_entity}
      end
    end
  end
  
  def update
    @sale_item = SaleItem.find(params[:id])
    
    respond_to do |format|
      if @sale_item.update_attributes(params[:sale_item])
        format.html { redirect_to sale_items_path, :notice => "Sale item successfully modified"}
        format.xml { head :ok }
      else
        format.html { render :action => 'edit'}
        format.xml {render :xml => @sale_item.errors, :status=>:unprocessible_entity}
      end   
    end
    
  end
  
  def destroy
    @sale_item = SaleItem.find(params[:id])
    
    respond_to do |format|
      if @sale_item.destroy
        format.html {redirect_to sale_items_path, :notice=>"Sale item successfully deleted"}
        format.xml { head :ok}
      else
        format.html {redirect_to sale_items_path, :notice=>"Sale item NOT deleted"}
        format.xml { head :bad_request}
      end
    end
    
    
  end
  
end
