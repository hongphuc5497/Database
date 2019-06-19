class ComplexNumber
    attr_accessor :real, :imaginary

    def initialize(real, imaginary)
        @real = real
        @imaginary = imaginary
    end

    # def self.input
    #     print "Pls input real number : "
    #     real = gets.chomp
    #     @real = real.to_i
    #     print "Pls input imaginary number : "
    #     imaginary = gets.chomp
    #     @imaginary = imaginary.to_i
    #     complex = ComplexNumber.new(@real,@imaginary)
    # end

    def output
        "#{self.real} + #{self.imaginary}i"
    end
    # def self.output(complex)
    #     puts "#{complex.real} + #{complex.imaginary}i"
    # end

    def +(t)
        self.real += t.real
        self.imaginary += t.imaginary
        self
    end
    # def sum(t)
    #     @real += t.real
    #     @imaginary += t.imaginary
    #     self
    # end

    def -(t)
        self.real -= t.real
        self.imaginary -= t.imaginary
        self
    end
    # def subtract(t)
    #     @real -= t.real
    #     @imaginary -= t.imaginary
    #     self
    # end

    def *(t)
        self.real = (self.real * t.real) - (self.imaginary * t.imaginary)
        self.imaginary = (self.real * t.imaginary) - (self.imaginary * t.real)
        self
    end
    # def multiply(t)
    #     @real = (@real * t.real) - (@imaginary * t.imaginary)
    #     @imaginary = (@real * t.imaginary) - (@imaginary * t.real)
    #     self
    # end

    def /(t)
        self.real = ((self.real * t.real) + (self.imaginary + t.imaginary))/(t.real*t.real) + (t.imaginary*t.imaginary)
        self.imaginary = ((self.imaginary * t.real) - (self.real * t.imaginary))/(t.real*t.real) + (t.imaginary*t.imaginary)
        self
    end
    # def divide(t)
    #     @real = ((@real * t.real) + (@imaginary + t.imaginary))/(t.real*t.real) + (t.imaginary*t.imaginary)
    #     @imaginary = ((@imaginary * t.real) - (@real * t.imaginary))/(t.real*t.real) + (t.imaginary*t.imaginary)
    #     self
    # end   
end





# a = ComplexNumber.input
# b = ComplexNumber.input
a = ComplexNumber.new(3, 9)
b = ComplexNumber.new(5, 15)
print "Complex number : " 
#ComplexNumber.output(a) 
puts a.output
puts b.output

print "Sum : "
# ComplexNumber.output(a.sum(b))
c = a.clone 
puts (c+b).output

print "Subtract : "
# ComplexNumber.output(a.subtract(b))
d = a.clone
puts (d-b).output

print "Multiply : "
# ComplexNumber.output(a.multiply(b))
e = a.clone
puts (e*a).output

print "Divide : "
# ComplexNumber.output(a.divide(b))
f = a.clone
puts (f/b).output



