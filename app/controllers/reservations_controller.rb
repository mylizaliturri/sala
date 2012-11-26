require 'date'

class ReservationsController < ApplicationController
  def test

  end

  def validate
    #mi codigo
    fecha=params[:fecha]
    hora=params[:hora]
    start_time=Date.strptime(fecha, "%m/%d/%Y")
    anio=start_time.year
    mes=start_time.month
    dia=start_time.mday

    d=DateTime.new(anio,mes,dia,hora.to_i,0,0).to_time

    cal = Google::Calendar.new(:username => 'dccsala@gmail.com',
                               :password => 'maruca24',
                               :app_name => 'mycompany.com-googlecalendar-integration')

    event = cal.create_event do |e|
      e.title = session[:user_id]
      e.start_time = d
      e.end_time = d + (60 * 60) # seconds * min
    end

    puts event

    redirect_to root_url, :notice => @fecha +"-"+@hora
  end
end

