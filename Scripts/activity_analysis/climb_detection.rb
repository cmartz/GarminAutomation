require 'csv'

puts 'Hello, World!'

def climb
    
    climbing = false
    prev_alt = 0
    
    CSV.foreach("activity.csv") do |row|
        row = row.to_s.split(', ')
        row = row.drop_while {|i| i != "\"position_lat\"" }
        
        lat = row[1]
        long = row[4]
        
        row = row.drop_while {|i| i != "\"altitude\""}
        
        altitude = row[1].to_s
        altitude.delete! "\""
        
        row = row.drop_while {|i| i != "\"cadence\""}
        
        cadence = row[1].to_s
        cadence.delete! "\""
        
        #if row != [] and (cadence.to_i) >= 90
        if altitude.to_i >= prev_alt
            if climbing == false
                climbing = true
                puts 'Start of the Climb!'
            end
            print "latitude: ", lat, " longitude: ", long, " Altitude: ", altitude, " Cadence: ", cadence,  "\n"
        else
            if climbing == true
                puts 'End of the Climb!'
                climbing = false
            end
        end
        
        prev_alt = altitude.to_i
    end
end


climb


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