require 'date'

class ReservationsController < ApplicationController
  before_filter :login_required

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
    owner=User.find_by_id(session[:user_id])
    Twitter.update("@"+owner.twitter+", Reserva el proximo "+fecha+ " a las "+hora+":00 hrs")

    event = cal.query

    event = cal.create_event do |e|
      e.title = owner.name+" "+owner.lastname
      e.start_time = d +(8*60*60)
      e.end_time = d + (9*60 * 60) # seconds * min
    end

    puts event

    redirect_to root_url, :notice => fecha+"-"+hora
  end
end

