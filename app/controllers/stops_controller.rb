class StopsController < ApplicationController
  before_filter :authorize

  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy

    respond_to do |format|
      format.html { redirect_to request.referer || home_path }
      format.json { head :ok }
    end
  end
end
