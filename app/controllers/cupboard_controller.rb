class CupboardController < ApplicationController
  
  def add
    # get the Id of the product
    id = params[:id]
    
      # use existing cupboard if it exists else create a blank cupboard
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
  
  def createOrder 
    # Step 1: Get the current user 
    @user = User.find(current_user.id) 
    
    # Step 2: Create a new order and associate it with the current user 
    @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending') 
    @order.save 
    
    # Step 3: For each item in the upboard, create a new ingredient
    @cupboard = session[:cupboard] || {} # Get the content of the Cupboard
    @cupboard.each do | id, quantity | ingredient = Ingredient.find_by_id(id) 
    @orderitem = @order.orderitems.build(:ingredient_id => ingredient.id, :title => ingredient.title)
    @orderitem.save 
    end
    
    @orders = Order.all
    
    @orderitems = Orderitem.where(order_id: Order.last)
    
    # session[:cart] =  nil 'Hidden for development'
    
  end
end
