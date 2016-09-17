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

  private
    def record_param
      params.require(:record).permit(:title,:date,:amount)
    end
end
