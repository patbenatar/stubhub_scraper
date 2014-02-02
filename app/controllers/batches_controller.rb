class BatchesController < ApplicationController
  helper_method :batch

  def show; end

  private

  def batch
    @batch ||= Batch.find(params[:id])
  end
end
