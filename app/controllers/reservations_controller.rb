class ReservationsController < ApplicationController
  def test

  end

  def validate
    #mi codigo
    @fecha=params[:fecha]
    @hora=params[:hora]
    redirect_to root_url, :notice => @fecha +"-"+@hora
  end
end

