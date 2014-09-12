class EmailAccessesController < ApplicationController
  before_action :set_email_access, only: [:show, :edit, :update, :destroy]

  # GET /email_accesses
  # GET /email_accesses.json
  def index
    @email_accesses = EmailAccess.all
  end

  # GET /email_accesses/1
  # GET /email_accesses/1.json
  def show
  end

  # GET /email_accesses/new
  def new
    @email_access = EmailAccess.new
  end

  # GET /email_accesses/1/edit
  def edit
  end

  # POST /email_accesses
  # POST /email_accesses.json
  def create
    @email_access = EmailAccess.new(email_access_params)

    respond_to do |format|
      if @email_access.save
        format.html { redirect_to @email_access, notice: 'Email access was successfully created.' }
        format.json { render :show, status: :created, location: @email_access }
      else
        format.html { render :new }
        format.json { render json: @email_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_accesses/1
  # PATCH/PUT /email_accesses/1.json
  def update
    respond_to do |format|
      if @email_access.update(email_access_params)
        format.html { redirect_to @email_access, notice: 'Email access was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_access }
      else
        format.html { render :edit }
        format.json { render json: @email_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_accesses/1
  # DELETE /email_accesses/1.json
  def destroy
    @email_access.destroy
    respond_to do |format|
      format.html { redirect_to email_accesses_url, notice: 'Email access was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_access
      @email_access = EmailAccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_access_params
      params.require(:email_access).permit(:mail_server, :identifier)
    end
end
