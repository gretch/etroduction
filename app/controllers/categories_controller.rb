class CategoriesController < ApplicationController
  before_filter :set_category, :only => [:show, :edit, :destroy, :update]

  def show
    @contents = @category.contents.paginate(:page => params[:page], :per_page => 10)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected
  def set_category
    @category = Category.find_by_param(params[:id])
  end
end
