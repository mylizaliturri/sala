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
    #d=Time.local(anio,mes,dia,hora.to_i, 0,0)
    d=DateTime.new(anio,mes,dia,hora.to_i,0,0).to_time

    cal = Google::Calendar.new(:username => 'dccsala@gmail.com',
                               :password => 'maruca24',
                               :app_name => 'mycompany.com-googlecalendar-integration')
    owner=User.find_by_id(session[:user_id])
    p "------ puta"
    p d
    if cal.find_events_in_range(d+(8*60*60),d+(9*60*60)).nil?
      event = cal.create_event do |e|
        e.title = owner.name+" "+owner.lastname
        e.start_time = d +(8*60*60)
        e.end_time = d + (9*60 * 60) # seconds * min
      end
      redirect_to root_url, :notice => fecha+"-"+hora
      begin
        Twitter.update("@"+owner.twitter+", asignado "+fecha+ " a las "+hora+":00 hrs")
      rescue Exception
        p "error en twitter"
      end


    else
      redirect_to root_url, :notice => "Horario no disponible"
    end
  end
end

