class ClientsController < ApplicationController

  def new
    @client = Client.new
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    authorize @client
    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def show
    @client = Client.find(params[:id])
    authorize @client
  end

  def index
    @clients = policy_scope(Client)
  end

  def edit
    @client = Client.find(params[:id])
    authorize @client
  end

  def update
    @client = Client.find(params[:id])
    authorize @client
    if @client.update(client_params)
      redirect_to client_path(@client)
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    authorize @client
    redirect_to clients_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone_number, :email, :user_id)
  end
end
