# This controller is responsible for managing game designers
class DesignersController < ApplicationController
  before_action :set_designer, only: %i[show edit update destroy]

  # GET /designers or /designers.json
  def index
    @designers = Designer.all
  end

  # GET /designers/1 or /designers/1.json
  def show; end

  # GET /designers/new
  def new
    @designer = Designer.new
  end

  # GET /designers/1/edit
  def edit; end

  # POST /designers or /designers.json
  def create
    @designer = Designer.new(designer_params)

    respond_to do |format|
      if @designer.save
        format.html { redirect_to designer_url(@designer), notice: notice(@designer, :create) }
        format.json { render :show, status: :created, location: @designer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /designers/1 or /designers/1.json
  def update
    respond_to do |format|
      if @designer.update(designer_params)
        format.html { redirect_to designer_url(@designer), notice: notice(@designer, :update) }
        format.json { render :show, status: :ok, location: @designer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designers/1 or /designers/1.json
  def destroy
    @designer.destroy!

    respond_to do |format|
      format.html { redirect_to designers_url, notice: notice(@designer, :delete) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_designer
    @designer = Designer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def designer_params
    params.require(:designer).permit(:name, :website)
  end
end
