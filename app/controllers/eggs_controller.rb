class EggsController < ApplicationController

  def index
    @eggs = Egg.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eggs }
    end
  end

  def show
    @egg = Egg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @egg }
    end
  end

  def new
    @egg = Egg.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @egg }
    end
  end

  def edit
    @egg = Egg.find(params[:id])
  end

  def create
    @egg = Egg.new(params[:egg])

    respond_to do |format|
      if @egg.save
        format.html { redirect_to @egg, notice: 'Egg was successfully created.' }
        format.json { render json: @egg, status: :created, location: @egg }
      else
        format.html { render action: "new" }
        format.json { render json: @egg.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @egg = Egg.find(params[:id])

    respond_to do |format|
      if @egg.update_attributes(params[:egg])
        format.html { redirect_to @egg, notice: 'Egg was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @egg.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @egg = Egg.find(params[:id])
    @egg.destroy

    respond_to do |format|
      format.html { redirect_to eggs_url }
      format.json { head :ok }
    end
  end
end
