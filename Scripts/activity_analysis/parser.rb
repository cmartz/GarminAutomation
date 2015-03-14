require 'csv'
include Math

puts 'Hello, World!'

def parse
    
    moving = false
    
    prev_alt = 0
    prev_lat = 0
    prev_long = 0
    ac_delta_movement = 0
    
    CSV.foreach("activity.csv") do |row|
        row = row.to_s.split(', ')
        row = row.drop_while {|i| i != "\"position_lat\"" }
        
        if row.empty?
            next
        end
        
        lat = row[1].to_s
        lat.delete! "\""
        lat = lat.to_i
        long = row[4].to_s
        long.delete! "\""
        long = long.to_i
        
        row = row.drop_while {|i| i != "\"altitude\""}
        
        altitude = row[1].to_s
        altitude.delete! "\""
        altitude = altitude.to_i
        
        print "latitude: ", lat, " longitude: ", long, " Altitude: ", altitude, "\n"
        
        if prev_lat == '0' and prev_long == '0' and prev_alt == '0'
            puts "what"
            next
        end
        
        delta_lat = (lat - prev_lat)**2
        delta_long = (long - prev_long)**2
        delta_alt = (altitude - prev_alt)**2
        delta_movement = sqrt(delta_lat + delta_long + delta_alt)
        
        prev_lat = lat
        prev_long = long
        prev_alt = altitude
        
        ac_delta_movement += delta_movement
        
        if ac_delta_movement >= 25
            ac_delta_movement = 0
        end
        
    end
end


parse


prev_alt = 0

#CSV.foreach("activity.csv") do |row|
#   row = row.to_s.split(', ')
#   row = row.drop_while {|i| i != "\"position_lat\"" }
#
#   lat = row[1]
#    long = row[4]
    
#    row = row.drop_while {|i| i != "\"altitude\""}
    
#    altitude = row[1].to_s
#   altitude.delete! "\""
    
#   row = row.drop_while {|i| i != "\"cadence\""}
    
#   cadence = row[1].to_s
#   cadence.delete! "\""
    
    #if row != [] and (cadence.to_i) >= 90
#   if altitude.to_i > prev_alt
#       print "latitude: ", lat, " longitude: ", long, " Altitude: ", altitude, " Cadence: ", cadence,  "\n"
#       prev_alt = altitude.to_i
#   end
    
    
#end