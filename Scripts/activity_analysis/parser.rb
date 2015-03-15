require 'csv'
include Math

puts 'Hello, World!'

def parse
    
    moving = false
    
    prev_time = 0
    prev_alt = 0
    prev_lat = 0
    prev_long = 0
    ac_delta_movement = 0
    
    ref_time = 0
    
    CSV.foreach("test.csv") do |row|
        row = row.to_s.split(', ')
        
        row = row.drop_while { |i| i != "\"timestamp\"" }
        
        time = row[1].to_s
        time.delete! "\""
        time = time.to_i
        
        if time < prev_time
            next
        end
        
        print "time elapsed: ", time, "\n"
        
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
        
        #print "latitude: ", lat, " longitude: ", long, " Altitude: ", altitude, "\n"
        
        delta_lat = (lat - prev_lat)**2
        delta_long = (long - prev_long)**2
        delta_alt = (altitude - prev_alt)**2
        delta_movement = sqrt(delta_lat + delta_long + delta_alt)
        
        prev_time = time
        prev_lat = lat
        prev_long = long
        prev_alt = altitude
        
        ac_delta_movement += delta_movement
        
        if ac_delta_movement >= 25
            ac_delta_movement = 0
            ref_time = time
        elsif (time - ref_time) >= 300
            puts "stop >= 5 minutes"
            puts time - ref_time
            print "latitude: ", prev_lat, " longitude: ", prev_long, " Altitude: ", altitude, "\n"
        end
        
    end
end


parse


