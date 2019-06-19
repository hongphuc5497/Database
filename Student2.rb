class Student
  attr_accessor :name, :gender, :math, :physics, :chemicals, :technology, :housework
  @@female = []
  @@male = []

  def initialize(name, gender, math, physics, chemicals, technology, housework)  
    @name = name
    @gender = gender
    @math = math
    @physics = physics
    @chemicals = chemicals
    @technology = technology
    @housework = housework
  end

  def self.input
    print "Input name of student: "
    @name = gets.chomp.capitalize
    print "Input gender of student: "
    @gender = gets.chomp.capitalize
    print "Math: "
    @math = gets.chomp.to_i
    print "Physics: "
    @physics = gets.chomp.to_i
    print "Chemicals: "
    @chemicals = gets.chomp.to_i
    case @gender 
    when "Male"
      print "Technology: "
      @technology = gets.chomp.to_i
      m = Male.new(@name, @gender, @math, @hysics, @chemicals, @technology)
      @@male << m
    when "Female"
      print "Housework: "
      @housework = gets.chomp.to_i
      fm = Female.new(@name, @gender, @math, @physics, @chemicals, @housework)
      @@female << fm
    end
  end

  def output
    "Information of student: #{@name}, Math: #{@math},Physics: #{@physics},Chemicals: #{@chemicals},"
    output = "Information of student:#{name} ,#{gender} ,Math: #{math},Physics: #{physics},Chemicals: #{chemicals},"
    case @gender
      when "Male"
          output += " Techonology: #{technology}"
      when "Female"
          output +=" Housework: #{housework}"
      end
    puts output
  end

  def self.find_student
    @@male.each do |m|
       m.output unless m.technology < 8
    end
  end

  def self.output_liststudent
    puts "List student in order : "
    (@@male + @@female).each do |i|
      i.output
    end
  end
end

class Male < Student
  attr_accessor :name, :gender, :math, :physics, :chemicals, :technology
  
  def initialize(name, gender, math, physics, chemicals, technology)
    @name = name
    @gender = gender
    @math = math
    @physics = physics
    @chemicals = chemicals
    @technology = technology
  end

end

class Female < Student
  attr_accessor :name, :gender, :math, :physics, :chemicals, :housework

  def initialize(name, gender, math, physics, chemicals, housework)
    @name = name
    @gender = gender
    @math = math
    @physics = physics
    @chemicals = chemicals
    @housework = housework
  end

end


print "Input number of student: "
number = gets.chomp.to_i
for i in 1..number
  Student.input
end

Male.find_student
Student.output_liststudent


