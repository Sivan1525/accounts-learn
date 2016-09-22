class RecordsController < ApplicationController

  def index
    @records = Record.all
  end

  def create
    @record = Record.new record_param

    if @record.save
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_param)
      render json: @record
    else
      render json: @record.errors, status: :unproccessable_entity
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    head :no_content
  end

  private
    def record_param
      params.require(:record).permit(:title,:date,:amount)
    end
end
