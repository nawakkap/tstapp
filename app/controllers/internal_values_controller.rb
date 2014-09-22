class InternalValuesController < ApplicationController
  before_action :set_internal_value, only: [:show, :edit, :update, :destroy]

  # GET /internal_values
  # GET /internal_values.json
  def index
    @internal_values = InternalValue.all
  end

  # GET /internal_values/1
  # GET /internal_values/1.json
  def show
  end

  # GET /internal_values/new
  def new
    @internal_value = InternalValue.new
  end

  # GET /internal_values/1/edit
  def edit
  end

  # POST /internal_values
  # POST /internal_values.json
  def create
    @internal_value = InternalValue.new(internal_value_params)

    respond_to do |format|
      if @internal_value.save
        format.html { redirect_to @internal_value, notice: 'Internal value was successfully created.' }
        format.json { render :show, status: :created, location: @internal_value }
      else
        format.html { render :new }
        format.json { render json: @internal_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internal_values/1
  # PATCH/PUT /internal_values/1.json
  def update
    respond_to do |format|
      if @internal_value.update(internal_value_params)
        format.html { redirect_to @internal_value, notice: 'Internal value was successfully updated.' }
        format.json { render :show, status: :ok, location: @internal_value }
      else
        format.html { render :edit }
        format.json { render json: @internal_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_values/1
  # DELETE /internal_values/1.json
  def destroy
    @internal_value.destroy
    respond_to do |format|
      format.html { redirect_to internal_values_url, notice: 'Internal value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_value
      @internal_value = InternalValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_value_params
      params.require(:internal_value).permit(:category, :name, :value, :seq)
    end
end
