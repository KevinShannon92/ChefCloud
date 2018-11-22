class StaticPagesController < ApplicationController

  def home
    @recipes = Recipe.all
  end


  def help
  end

  def about
  end
end
