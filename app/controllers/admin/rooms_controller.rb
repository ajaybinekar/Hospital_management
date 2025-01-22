require 'csv'

class Admin::RoomsController < ApplicationController
  def generate_report
    @rooms = Room.all

    respond_to do |format|
      format.csv { send_data generate_room_csv(@rooms), filename: "rooms_report.csv" }
    end
  end

  private

  def generate_room_csv(rooms)
    CSV.generate(headers: true) do |csv|
      csv << ['Room Name', 'Capacity', 'Occupied Beds']
      rooms.each do |room|
        csv << [room.name, room.capacity, room.beds.where(available: false).count]
      end
    end
  end
end
