class CupboardController < ApplicationController
  
  def add
    # get the Id of the ingredient
    id = params[:id]

      # use existing cupboard if it exists else create a blank cupboard
      if session[:cupboard] then
      cupboard = session[:cupboard]
    else
        session[:cupboard] = {}
      cupboard = session[:cupboard]
      end
       
     #If the ingredient is already added it increments by 1 else ingredient set to 1
      if cupboard[id] then
       cupboard[id] = cupboard[id] + 100
      else
       cupboard[id]= 100
      end  
  
  redirect_to :action => :index

  end

  def clearCupboard
    #sets session variable to nil and bring back to index
    session[:cupboard] = nil
    redirect_to :action => :index
  end 
  
  def setQuantity
    
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
