class HostsController < ApplicationController
  # GET /hosts
  def index
    @hosts = Host.all
  end

  # GET /hosts/1
  def show
    @host = Host.find(params[:id])
  end

  # GET /hosts/new
  def new
    @host = Host.new
  end

  # GET /hosts/1/edit
  def edit
    @host = Host.find(params[:id])
  end

  # POST /hosts
  def create
    @host = Host.new(host_params)

    if @host.save
      redirect_to @host, notice: 'Host was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hosts/1
  def update
    @host = Host.find(params[:id])
    if @host.update(host_params)
      redirect_to @host, notice: 'Host was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hosts/1
  def destroy
    @host = Host.find(params[:id])
    @host.destroy
    redirect_to hosts_url, notice: 'Host was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def host_params
    params.require(:host).permit(:name, :web_link, :market_info)
  end
end
