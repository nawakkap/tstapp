class BacklogsController < ApplicationController
  before_action :set_backlog, only: [:show, :edit, :update, :destroy]

  # GET /backlogs
  # GET /backlogs.json
  def index
    refreshBacklogLegacy  
    @backlogs = Backlog.all
  end

  # GET /backlogs/1
  # GET /backlogs/1.json
  def show
  end

  # GET /backlogs/new
  def new
    @backlog = Backlog.new
  end

  # GET /backlogs/1/edit
  def edit
  end

  # POST /backlogs
  # POST /backlogs.json
  def create
    @backlog = Backlog.new(backlog_params)

    respond_to do |format|
      if @backlog.save
        format.html { redirect_to @backlog, notice: 'Backlog was successfully created.' }
        format.json { render :show, status: :created, location: @backlog }
      else
        format.html { render :new }
        format.json { render json: @backlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backlogs/1
  # PATCH/PUT /backlogs/1.json
  def update
    respond_to do |format|
      if @backlog.update(backlog_params)
        format.html { redirect_to @backlog, notice: 'Backlog was successfully updated.' }
        format.json { render :show, status: :ok, location: @backlog }
      else
        format.html { render :edit }
        format.json { render json: @backlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backlogs/1
  # DELETE /backlogs/1.json
  def destroy
    @backlog.destroy
    respond_to do |format|
      format.html { redirect_to backlogs_url, notice: 'Backlog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backlog
      @backlog = Backlog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backlog_params
      params.require(:backlog).permit(:custname, :product_id, :productCode, :sono, :orderDate, :orderAmt, :backlog)
    end
    

end
