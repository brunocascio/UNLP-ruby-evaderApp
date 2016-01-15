class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @invoices_current_year = @client.total_invoices_current_year_by_month
    @amount_total_invoices_by_year = @client.amount_total_invoices_by_year
    @most_invoiced_people = @client.most_invoiced_people(5)
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: t('client_was_successfully_created') }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: t('client_was_successfully_updated') }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    msg = t 'client_cannot_be_deleted'
    if @client.destroy
      msg = t 'client_was_successfully_destroyed.'
    end
    respond_to do |format|
      format.html { redirect_to clients_url, notice: msg }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params
        .require(:client)
        .permit(
          :firstname, :lastname, :birthdate,
          :genre, :identification_number,
          :cuilt, clients_contacts_attributes: [:id, :contact_id, :value, :_destroy])
    end
end
