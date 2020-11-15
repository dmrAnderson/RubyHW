class Pets
	def initialize(name)
		@name = name
		@hp = 100
		@mood = 100
		@hunger = 0
		@tiredness = 0
		@power = 100
		@status = @@status[-1]
		@age = {year: 0, mount: 0, day: 0, hour: 0}
		@end = false
		@command = %w(feed play sleep feel help norm_day follow quit)
		@num_hp = rand(5..10)
		@num_hunger = rand(5..10)
		@num_power = rand(5..10)
	end

	def feed
		p 'You feed him.'
		change_features(1, 2, -2, 1)
		p 'I guess he likes it.'
	end

	def walk(time)
		p "You walk with #{@name}."
		change_features(0, -1, -1, time)
	end

	def go_to_sleep
		p "#{@name} went sleep."
		p "He's sleeping."
		sleep(8)
		change_features(2, 2, 0, 8)
	end

	def follow
		r = rand(1..5)
		case r
      when 1
				p "#{@name} began to run around the room and accidentally fell."
				change_features(-1, -1, -0.5, 1, -3)
			when 2
				p "#{@name} ran to the yard and found there a tennis ball, which had recently disappeared. He was very happy."
				change_features(0, -1, -0.5, 1, 3)
			when 3
				p "#{@name} played in the yard with a tennis ball and could throw it as high as ever."
				change_features(0, -1, -0.5, 1, 4)
			when 4
				p "#{@name} played in the yard with a tennis ball and threw it into the bushes."
				change_features(0, -1, -0.5, 1, -3)
			when 5
				p "#{@name} went into the kitchen and found an uneaten sandwich in the trash. He ate it."
				change_features(1, -1, 0.5, 1, 3)
		end
	end

	def help
		s = '.'
		n = 10
		p @command[0].ljust(n, s) + 'Feed your pet.'
		p @command[1].ljust(n, s) + 'Play with your pet.'
		p @command[2].ljust(n, s) + 'Put him to sleep.'
		p @command[3].ljust(n, s) + "Ask him: 'How do you feel?'"
		p @command[4].ljust(n, s) + 'Show all command for your pet.'
		p @command[5].ljust(n, s) + 'Spend the usual day.'
		p @command[6].ljust(n, s) + 'Just watch at you pet.'
		p @command[7].ljust(n, s) + 'Finish the game.'
		p
	end

	def play
		$count = 0
		@play_command = %w(sit stand up down run bring_ball help quit)
		def sit
			p "#{@name} Took a seat."
			change_features(0, -0.3, -0.1)
			$count += 1
		end
		def stand_up
			p "#{@name} Stood up."
			change_features(0, -0.4, -0.2)
			$count += 1
		end
		def down
			p "#{@name} Layed down."
			change_features(0, -0.2, -0.1)
			$count += 1
		end
		def run
			p "#{@name} Was running."
			change_features(0, -1, -0.4)
			$count += 2
		end
		def bring_ball
			p "#{@name} Was running and took that ball."
			change_features(0, -1, -0.5)
			$count += 2
		end
		def help_play
			s = '.'
			n = 13
			p @play_command[0].ljust(n, s) + "Command: 'sit'."
			p @play_command[1].ljust(n, s) + "Command: 'stand up'."
			p @play_command[2].ljust(n, s) + "Command: 'lay down'."
			p @play_command[3].ljust(n, s) + "Command: 'run'."
			p @play_command[4].ljust(n, s) + "Command: 'bring me a ball'."
			p @play_command[5].ljust(n, s) + 'Show all commands.'
			p @play_command[6].ljust(n, s) + 'Finish the game.'
			p
		end

		p "#{@name} wanna plays with you."
		p "It's commands for your:"
		help_play
		p 'Tell him, what he has to do: '
		p
		while true
			comm = gets.chomp.downcase
			case comm
				when @play_command[0]
					sit
				when @play_command[1]
					stand_up
				when @play_command[2]
					down
				when @play_command[3]
					run
				when @play_command[4]
					bring_ball
				when @play_command[5]
					help_play
				when @play_command[6]
					break
				else
					p "One more time, I didn't get it."
			end
			p ''
			p 'Next.'
			p "If you need some help, just write 'help'."
		end
		time = $count / 4
		if $count >= 8
			$count -= 8
		end
		change_features(-1, -1, time, time, 3)
	end

	def what_is_your_mood
		p "Health: #{@hp}"
		p "Hungry: #{@hunger}"
		p "Mood: #{@mood}"
		p "Power: #{@power}"
		p "tiredness: #{@tiredness}"
		p "Status: #{@status}"
		p "He lives with you for #{@age}"
	end

	def day_life
		change_features(0, -1, -1)
		add_day
	end

	attr_reader :end
	attr_reader :command

	private
	@@status = ['I wanna kill you!', 'I hate you so much!', 'I like you!', "I don't like you!",
				'It could be better.', 'Not bad..', 'Everything pretty good!', 'You make me crazy!', 'You rock!',
				'You are the best!', 'Never been better!']

	def add_day
		day_in_mount = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
		if @age[:day] + 1 <= day_in_mount[@age[:mount]]
			@age[:day] += 1
		elsif (@age[:mount] == 2 and
			(@age[:year] % 4 == 0 and @age[:year] % 100 == 0 or @age[:year] % 400 != 0))
			@age[:day] = 29
		else
			@age[:day] = 1
			if @age[:mount] <= 12
				@age[:mount] += 1
			else
				@age[:mount] = 1
				@age[:year] += 1
			end
		end
	end

	def change_features(hp, power, hunger, time = 0, mood = 0)
		@hp += hp * rand(@num_hp)
		if @hp > 100
			@hp = 100
		elsif @hp <= 0
			@hp = 0
			p "#{@name} was healthless and died, you totally."
			@end = true
		end
		@power += power * rand(@num_power)
		if @power > 100
			@power = 100
		elsif @power <= 0
			@power = 0
			p "#{@name} is powerless and can't do anything."
			@end = true
		end
		@hunger += hunger * rand(@num_hunger)
		if @hunger < 0
			@hunger = 0
		elsif @hunger >= 100
			@hunger = 0
			p "#{@name} is hungry as hell and wanna eat you."
			@end = true
		end
		@tiredness = 5 - @power / 20
		if @tiredness == 5
			p "#{@name} he's exhausted and doesn't wanna do anything."
			@end = true
		end
		@mood += (@hp - (@tiredness + @hunger) / 2) / 10 + mood
		if @mood > 100
			@mood = 100
		elsif @mood <= 0
			p "For some reasons #{@name} he has an awful mood."
			@end = true
		end
		add_hour(time)
	end

	def add_hour(n)
		@age[:hour] += n
		if @age[:hour] >= 24
			add_day
			@age[:hour] %= 24
		end
	end
end

p 'Hey there! Good to see you, buddy.'
p 'Welcome to my first ruby-game.'
p "I'm pretty sure, you wanna start, don't you?"
print "(just write 'y' or press Enter) => "
answer = gets.chomp.downcase
while true
	if answer == '' || answer == 'y'
		pets_list = %w(Dog Cat Dragon)
    p 'Cool! Now you should choose what kind of pet do you prefer.'
    p '(enter the number)'
		pets_list.length.times {|i| p (i + 1).to_s + ' ' + pets_list[i]}
		name_pet = gets.chomp.to_i
		while true
			case name_pet
				when 1
					my_pet = Pets.new(pets_list[0])
					break
				when 2
					my_pet = Pets.new(pets_list[1])
					break
				when 3
					my_pet = Pets.new(pets_list[2])
					break
        else
          p 'Oh.. gosh.'
					p 'Are you insane?! Please be focused that you got the message.'
					name_pet = gets.chomp.to_i
			end
		end
		p 'Awesome!'
    p "Accept my congratulations! Now you have new friend - #{pets_list[name_pet - 1]}."
    p 'You can start.'
    p 'Tell me, what are you gonna do?'
		p "If you need some help, just write 'help'."
		command = gets.chomp.downcase
		while command != 'stop'
			case command
				when my_pet.command[0]
					my_pet.feed
				when my_pet.command[1]
					my_pet.play
				when my_pet.command[2]
					my_pet.go_to_sleep
				when my_pet.command[3]
					my_pet.what_is_your_mood
				when my_pet.command[4]
					my_pet.help
				when my_pet.command[5]
					my_pet.day_life
				when my_pet.command[6]
					my_pet.follow
				when my_pet.command[7]
					break
				else
					p "One more time, I didn't get it."
			end
			if my_pet.end
				break
			end
			p 'Cool, second command.'
      p "If you need some help, just write 'help'."
      p ''
			command = gets.chomp.downcase
		end
    p "Great, look what you have now: #{my_pet.what_is_your_mood}"
		p "That's all, bay!"
		break
	elsif answer == 'n'
    p "So, it's all."
		p 'Have a nice day.'
		break
	else
    p 'What was that?'
		print 'Stop mess around, mister! (y/n): '
		answer = gets.chomp.downcase
	end
end
