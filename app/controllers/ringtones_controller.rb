class RingtonesController < ApplicationController
  before_action :set_ringtone, only: [:show, :edit, :update, :destroy]

  # GET /ringtones
  # GET /ringtones.json
  def index
    @ringtones = Ringtone.all
  end

  # GET /ringtones/1
  # GET /ringtones/1.json
  def show
  end

  # GET /ringtones/new
  def new
    @ringtone = Ringtone.new
  end

  # GET /ringtones/1/edit
  def edit
  end

  # POST /ringtones
  # POST /ringtones.json
  def create
    @ringtone = Ringtone.new(ringtone_params)

    respond_to do |format|
      if @ringtone.save
        format.html { redirect_to @ringtone, notice: 'Ringtone was successfully created.' }
        format.json { render :show, status: :created, location: @ringtone }
      else
        format.html { render :new }
        format.json { render json: @ringtone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ringtones/1
  # PATCH/PUT /ringtones/1.json
  def update
    respond_to do |format|
      if @ringtone.update(ringtone_params)
        format.html { redirect_to @ringtone, notice: 'Ringtone was successfully updated.' }
        format.json { render :show, status: :ok, location: @ringtone }
      else
        format.html { render :edit }
        format.json { render json: @ringtone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ringtones/1
  # DELETE /ringtones/1.json
  def destroy
    @ringtone.destroy
    respond_to do |format|
      format.html { redirect_to ringtones_url, notice: 'Ringtone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ringtone
      @ringtone = Ringtone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ringtone_params
      params.require(:ringtone).permit(:name, :delete_ring_tone, :source)
    end
end
