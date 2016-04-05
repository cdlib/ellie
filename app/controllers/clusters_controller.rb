class ClustersController < ApplicationController
  
  # GET /clusters/1
  # GET /clusters/1.json
  def show
    @cluster = Cluster.find(params[:id])
  end

end
