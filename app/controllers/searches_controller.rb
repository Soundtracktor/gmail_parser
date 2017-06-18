# frozen_string_literal: true

class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)

    if @search.save
      redirect_to search_path(id: @search.token), notice: 'Search was successfully created.'
      GmailParseJob.perform_later(search_id: @search.id)
    else
      render :new
    end
  end

  def show
    @search = Search.find_by(token: params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:email, :password, :from_date, :to_date)
  end
end
