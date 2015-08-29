$LOAD_PATH << "."

require 'roach_rec.rb'

class Pistol #< Weapon
  def use
    mbed = Bedroom.new("Mike's Bedroom")
    mbed.enter()
    if mbed.iron_check
      return 'death' 
    end
    puts "You still have #{$count} roach left to kill"
    puts "You've got to crack the code that opens the safe containing your pistol to shoot this last bed-trolling hater!"

    @code_str = rand(1..9).to_s + rand(1..9).to_s + rand(1..9).to_s
    @code = @code_str.to_i

    @code_ints = @code_str.split('').map { |num| num.to_i }
    @code_sum = @code_ints.inject { |sum, n| sum + n }

    puts "code is #{@code}"
    puts "code adds to #{@code_sum}"

    puts "You have 10 guesses to get the 3-digit code right before the roach gets the best of you and you die. Hint, each digit is between 1 - 9 and they add up to #{@code_sum}"

    @guess = ""

    (1..10).each do |num|
      puts "This is guess number #{num}, what'll it be?:"
      puts "> "
      @guess = gets.chomp.to_i
      if @guess == @code
        puts "Boom. Unlocked the pistol. Get him!"
        return 'zero'    
      end
    end
    puts "sorry ... you didn't quite make it."
    return 'death'

  end


end

class Machete #< Weapon
  def use
    puts "Alright you got the roach the roaches out of the bathroom."
    mliving = Living.new("Mike's Living Room")
    mliving.enter()
    puts "There are only #{$count} roaches left to kill and you take out your machete."
    puts "What direction do you swing: left, right, up, or down?"
    @swing = gets.chomp.downcase

    if @swing != "left" && @swing != "right" && @swing != "up" && @swing != "down"
      puts "Guess you couldn't even figure out how to swing... so sad."
      return 'death'
    elsif @swing == "down"
      puts "you got some, but not enough, swing again and this time in a different direction... left, right or up?"
      @swing = gets.chomp.downcase
    end
 
    puts "swing now is #{@swing}"
    case @swing
    when "left", "right"
      puts "Yes! That wiped out all of them in #{mliving.room_name}!"
      $count = 1
    when "up"
      puts "fail. they're not on the ceiling, dumbass. and now you just sliced yourself up a bit w that machete.. oh geeze."
      return 'death'
    else
      puts "you really can't even figure out how to swing?"
      return 'death'
    end

    return 'one'
  end
end

class Grenade #< Weapon
  def use

    puts "Alright you got the roach the roaches out of the kitchen."
    mbath = Bathroom.new("Mike's Bathroom")
    mbath.enter()
    return 'death' if mbath.water_run

    puts "and the count down to #{$count}, but you're out of arsenic, but you've got some granades"

    @num1 = rand(1..10)
    @num2 = rand(1..10)

    @compare = ""

    puts "num1 is #{@num1} num2 is #{@num2}."

    if @num2.to_i > @num1.to_i
      @compare = "higher"
    elsif @num2.to_i < @num1.to_i
      @compare = "lower"
    else
      @compare = "equal to"
    end

    puts "To unlock the granades, you have to guess whether the secret second number code will be higher or lower than #{@num1}. It will be between 1 - 10."
    puts "So what do you think? Is the second code higher, lower or equal to than #{@num1}?"
    @guess = gets.chomp.downcase()

    if @guess != "higher" && @guess != "lower" && @guess != "equal to"
      puts "That wasn't an option, try again: higher, lower, or equal to... "
      @guess = gets.chomp.downcase()
    end

    def success
      puts "You got the roaches in #{mbath.room_name}!"
      $count = 10
      return 'ten'
    end

    if @guess == @compare
      success
    else
      puts "Sorry not sorry. Wrong."
      return 'death'
    end

  end
end

class Arsenic # < Weapon
  def use

    puts "You just arrived at Mike's apartment.. slowly you begin to notice it's infested with roaches! Eek! Of course, that's not your only concern, so let's tackle this beast of a problem room by room."

  	mkitch = Kitchen.new('Mike\'s Kitchen')
  	mkitch.enter()
  	if mkitch.water_run == true
  		return 'death'
  	end
  	$count = 1000

    @@strategies = ["Throw some arsenic at the roaches in the sink", "Put a thin layer down all over the floor", "Mix the arsenic with stale food and leave it out for them to eat"]

    @@safety = ["Did you wash the sink after you see the roaches die?", "Did you wash up the roaches from the floor after they died?", "Did you to eat any of the food by mistake?"]

    @@answers = ["no", "no", "yes"]

  	puts "EEK #{$count} roaches! You're gonna need to wipe these effers. Luckily you're armed with arsenic..."

    @@strategies.each_with_index do |strat, index| 
      puts strat
      puts "That got some!"
      puts "But..." + @@safety[index]
      answer = gets.chomp
      if answer.include?(@@answers[index])
        puts "Bad call. You just died as a result of your poor decision making."
        return 'death'
      else
        puts "Good job. You killed a lot of them!"
      end
      $count = $count / 2
      if $count == 125
        $count = 100
      end
      puts "Now there are only #{$count} roaches left to slaughter after killing all of them in #{mkitch.room_name}!"
    end
    return 'hundred'
  end
end

class Death # < Weapon
  def use
  	@@deaths = ["You blew die. Life's over now.", "Roaches climb all over your body and into your soul and you die.","Your days were numbered and today was the number.", "You never stood a chance. Sigh. Dead.", "You're done.", "Goner. Dead."]
  	puts @@deaths[rand(0..@@deaths.length)]
    exit(0)
  end
end

class Win # < Weapon
  def use
    puts "Winner - you killed all those gross little haters. Well done."
    exit(0)
  end
end

class Count
  @@counts = {
  	'one' => Pistol.new(),
  	'ten' => Machete.new(),
  	'hundred' => Grenade.new(),
  	'thousand' => Arsenic.new(),
  	'death' => Death.new(),
  	'zero' => Win.new()
  }

  def initialize(start)
  	@start = start
  end

  def next_weap(weap)
    weap_is = @@counts[weap]
    return weap_is
  end

  def start_weap()
  	next_weap(@start)
  end

end

a_count = Count.new('thousand')
a_killer = Killer.new(a_count)
a_killer.play()
