class OpportunitiesController < ApplicationController

  before_filter :set_content, :only => [:show, :edit, :update, :destroy, :published, :unpublished]

  def index
    @opportunities = Opportunity.recent.limit(20)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @opportunities }
    end
  end

  def manage
    @opportunities = Opportunity.paginate(:all, :order => "created_at DESC", :page => params[:page], :per_page => 30)
  end

  def show
    @opportunity.increment!(:hits)
  end

  def new
    @opportunity = Opportunity.new
  end

  def edit
  end

  def published
    @opportunity.published!

    respond_to do |format|
      format.html
    end
  end

  def unpublished
    @opportunity.unpublished!
    respond_to do |format|
      format.htmls
    end
  end

  def create
    @opportunity = Opportunity.new(params[:opportunity])

    respond_to do |format|
      if @opportunity.save
        flash[:notice] = 'Opportunity was successfully created.'
        format.html { redirect_to(@opportunity) }
        format.xml  { render :xml => @opportunity, :status => :created, :location => @opportunity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opportunity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @opportunity.update_attributes(params[:opportunity])
        flash[:notice] = 'Opportunity was successfully updated.'
        format.html { redirect_to(@opportunity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opportunity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @opportunity.destroy

    respond_to do |format|
      format.html { redirect_to(manage_contents_url) }
      format.xml  { head :ok }
    end
  end

  protected
    def set_content
      @opportunity = Opportunity.find(params[:id])
    end
end
