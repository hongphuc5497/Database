class Student
	attr_accessor :name, :gender, :math, :physics, :chemicals, :technology, :housework
  @@data = []

  def initialize(name, gender, math, physics, chemicals, technology, housework)  
    @name = name
    @gender = gender
    @math = math
    @physics = physics
    @chemicals = chemicals
    @technology = technology
    @housework = housework
  end

  def self.input_liststudent
    print "Input the number of student: "
		n = gets.chomp.to_i
    for i in 1..n
      input_1student
    end
  end

  def self.input_1student
    print "Input name of student: "
    name = gets.chomp.capitalize
    print "Input gender of student: "
    gender = gets.chomp.capitalize
    print "Math: "
    math = gets.chomp.to_i
    print "Physics: "
    physics = gets.chomp.to_i
    print "Chemicals: "
    chemicals = gets.chomp.to_i
    case gender
    when "Male"
        print "Technology: "
        technology = gets.chomp.to_i
    when "Female"
        print "Housework: " 
        housework = gets.chomp.to_i
    end
    student = Student.new(name, gender, math, physics, chemicals, technology || 0, housework || 0) 
    @@data << student
  end
  
  def output_1student
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
    @@data.each do |s|
      s.output_1student unless s.technology < 8
    end
  end

  def self.output_liststudent
    male = []
    female = []
    @@data.each do |s|
      s.gender == "Male" ? male << s : female << s
    end
    puts "List student in order : "
    (male + female).each do |s|
      s.output_1student
    end
  end
end

Student.input_liststudent
Student.find_student
Student.output_liststudent