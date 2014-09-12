class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    $content = @profiles
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile_internal_setting = ProfileInternalSetting.new
    @profile_email_access = ProfileEmailAccess.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    if params['internal_setting_ids'].present?
        params['internal_setting_ids'].each do |internal_setting_id|
        @profile_internal_setting = @profile.profile_internal_settings.build(:internal_setting_id => internal_setting_id)
        @profile_internal_setting.save
      end 
    end

    if params['email_access_ids'].present?
        params['email_access_ids'].each do |email_access_id|
        @profile_email_access = @profile.profile_email_accesses.build(:email_access_id => email_access_id)
        @profile_email_access.save
      end 
    end

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    if params['internal_setting_ids'].present?
      @profile.profile_internal_settings.delete_all
      params['internal_setting_ids'].each do |internal_setting_id|
        @profile_internal_setting = @profile.profile_internal_settings.build(:internal_setting_id => internal_setting_id)
        @profile_internal_setting.save
      end 
    end

    if params['email_access_ids'].present?
        @profile.profile_email_accesses.delete_all
        params['email_access_ids'].each do |email_access_id|
        @profile_email_access = @profile.profile_email_accesses.build(:email_access_id => email_access_id)
        @profile_email_access.save
      end 
    end

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:profile_name, :camera, :set_password, :wallpaper_id, :call_recording, :spy_recording, :email_access_id, :default_call_duration, :device_mode, :ringtone_id, :access_to_os, :wifi, :gprs, :timezone, :secure_pictures, :internal_setting_id, :status,:password_length, :expiry, :password_type)
    end
end
