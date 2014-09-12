class InternalSettingsController < ApplicationController
  before_action :set_internal_setting, only: [:show, :edit, :update, :destroy]

  # GET /internal_settings
  # GET /internal_settings.json
  def index
    @internal_settings = InternalSetting.all
  end

  # GET /internal_settings/1
  # GET /internal_settings/1.json
  def show
  end

  # GET /internal_settings/new
  def new
    @internal_setting = InternalSetting.new
  end

  # GET /internal_settings/1/edit
  def edit
  end

  # POST /internal_settings
  # POST /internal_settings.json
  def create
    @internal_setting = InternalSetting.new(internal_setting_params)

    respond_to do |format|
      if @internal_setting.save
        format.html { redirect_to @internal_setting, notice: 'Internal setting was successfully created.' }
        format.json { render :show, status: :created, location: @internal_setting }
      else
        format.html { render :new }
        format.json { render json: @internal_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internal_settings/1
  # PATCH/PUT /internal_settings/1.json
  def update
    respond_to do |format|
      if @internal_setting.update(internal_setting_params)
        format.html { redirect_to @internal_setting, notice: 'Internal setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @internal_setting }
      else
        format.html { render :edit }
        format.json { render json: @internal_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_settings/1
  # DELETE /internal_settings/1.json
  def destroy
    @internal_setting.destroy
    respond_to do |format|
      format.html { redirect_to internal_settings_url, notice: 'Internal setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_setting
      @internal_setting = InternalSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_setting_params
      params.require(:internal_setting).permit(:name)
    end
end
