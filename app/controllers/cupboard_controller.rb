class CupboardController < ApplicationController
  
  def add
    # get the Id of the product
    @ingredients = Ingredient.where(id: params[:ingredient_ids])
    
      # if the cupboard is already been created, use existing cupboard else create a blank cupboard
      if session[:cupboard] then
      cupboard = session[:cupboard]
    else
        session[:cupboard] = {}
      cupboard = session[:cupboard]
      end
       
     #If the product is already added it increments by 1 else product set to 1
      if cupboard[id] then
       cupboard[id] = cupboard[id] + 1
      else
       cupboard[id]= 1
      end  
  
  redirect_to :action => :index

  end

  def clearCupboard
    #sets session variable to nil and bring back to index
    session[:cupboard] = nil
    redirect_to :action => :index
  end 
  
  def remove
    
    id = params[:id]
    cupboard = session[:cupboard]
    cupboard.delete id
    
    redirect_to :root
  end
  
  
  def index
    # passes a cupboard to display
    if session[:cupboard] then
      @cupboard = session[:cupboard]
    else
      @cupboard = {}
    end  
  end
end
