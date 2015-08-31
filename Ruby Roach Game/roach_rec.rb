class Killer

  def initialize(count)
  	@count = count
  end
  
  def play
    curr_count = @count.start_weap()
    last_count = @count.next_weap('XXX')

    while curr_count != last_count
    	next_count = curr_count.use()
    	curr_count = @count.next_weap(next_count)
    end

    curr_count.use()

  end

end

class Room
  def initialize(room) 
    @room = room
  end

  def room_name
    @room
  end

  def enter
    puts "You enter the #{@room}"
  end
end

class Kitchen < Room
  
  def water_run
    puts "Check if the water's running"
    puts "Is it?"
    puts "> "
    answer = gets.chomp

    if answer.include?("y" || "yes" || "ya" || "yeah" || "it is")
      puts "freak out. you can't worry about roaches now, your apt is gonig to flood. you might as well die."
      return true
    else
      puts "phew; at least we ruled out that disaster!"
      return false
    end
  
  end

end


class Bathroom < Kitchen
end

class Living < Room
end

class Bedroom < Room
  def iron_check
  puts "Check if the iron's plugged in"
    puts "Is it?"
    puts "> "
    answer = gets.chomp

    if answer.include?("y" || "yes" || "ya" || "yeah" || "it is")
      puts "freak out. you can't worry about roaches now, your apt is gonig to catch fire in mere moments, surely. you might as well die."
      return true
    else
      puts "phew; at least we ruled out that disaster!"
      return false
    end
  
  end

end


