class Student
		attr_accessor :name, :gender, :math, :physics, :chemicals, :technology, :housework, :data
		@@data = []

			
		def input
			print "Input the number of student : "
			@number = gets.chomp.to_i
			i = 0
			while i < @number
				i += 1
        print "Input name of student : "
        @name = gets.chomp.capitalize
        print "Input gender of student : "
				@gender = gets.chomp.capitalize
        puts "Input score of student : "
        print "Math : "
        @math = gets.chomp.to_i
        print "Physics : "
        @physics = gets.chomp.to_i
        print "Chemicals : "
        @chemicals = gets.chomp.to_i
        case gender
        when "Male"
            print "Technology : "
            @technology = gets.chomp.to_i
        when "Female"
            print "Housework : " 
            @housework = gets.chomp.to_i
				end
				@@data.push(self)
				puts @@data
			end
		end
		


		def display
        case @gender 
        when "Male"
        puts "Information of student : #{@name}, #{@gender}, Math: #{@math}, Physics: #{@physics}, Chemicals: #{@chemicals}, Techonology: #{@technology}"
        when "Female"
            puts "Information of student : #{@name}, #{@gender}, Math: #{@math}, Physics: #{@physics}, Chemicals: #{@chemicals}, Housework: #{@housework}"
        end
		end

		def self.find_student
			@@data.select do |s| 
				puts s.display if s.technology > 8
			end
		end
end

a = Student.new
a.input
array = a.data

# array.each do |x| x.display 
# end





