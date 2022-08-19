class NuevasController < ApplicationController
  before_action :set_nueva, only: %i[ show edit update destroy ]

  # GET /nuevas or /nuevas.json
  def index
    @nuevas = Nueva.all
  end

  # GET /nuevas/1 or /nuevas/1.json
  def show
  end

  # GET /nuevas/new
  def new
    @nueva = Nueva.new
  end

  # GET /nuevas/1/edit
  def edit
  end

  # POST /nuevas or /nuevas.json
  def create
    @nueva = Nueva.new(nueva_params)

    respond_to do |format|
      if @nueva.save
        format.html { redirect_to nueva_url(@nueva), notice: "Nueva was successfully created." }
        format.json { render :show, status: :created, location: @nueva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nueva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nuevas/1 or /nuevas/1.json
  def update
    respond_to do |format|
      if @nueva.update(nueva_params)
        format.html { redirect_to nueva_url(@nueva), notice: "Nueva was successfully updated." }
        format.json { render :show, status: :ok, location: @nueva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nueva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nuevas/1 or /nuevas/1.json
  def destroy
    @nueva.destroy

    respond_to do |format|
      format.html { redirect_to nuevas_url, notice: "Nueva was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nueva
      @nueva = Nueva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nueva_params
      params.require(:nueva).permit(:encabezado, :cuerpo, :tipo)
    end
end
