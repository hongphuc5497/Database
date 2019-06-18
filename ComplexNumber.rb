class ComplexNumber
    attr_accessor :real, :imaginary

    def initialize(real, imaginary)
        @real = real
        @imaginary = imaginary
    end


    def self.input
        print "Pls input real number : "
        real = gets.chomp
        @real = real.to_i
        print "Pls input imaginary number : "
        imaginary = gets.chomp
        @imaginary = imaginary.to_i
        complex = ComplexNumber.new(@real,@imaginary)
    end

    def self.output(complex)
        puts "#{complex.real} + #{complex.imaginary}i"
    end

    def sum(t)
        @real += t.real
        @imaginary += t.imaginary
        self
    end

    def subtract(t)
        @real -= t.real
        @imaginary -= t.imaginary
        self
    end

    def multiply(t)
        @real = (@real * t.real) - (@imaginary * t.imaginary)
        @imaginary= (@real * t.imaginary) + (@imaginary * t.real)
        self
    end

    def divide(t)
        @real = ((@real * t.real) + (@imaginary + t.imaginary))/(t.real*t.real) + (t.imaginary*t.imaginary)
        @imaginary = ((@imaginary * t.real) - (@real * t.imaginary))/(t.real*t.real) + (t.imaginary*t.imaginary)
        self
    end   
end


a = ComplexNumber.input
b = ComplexNumber.input

print "Complex number : " 
ComplexNumber.output(a) 
print "Sum : "
ComplexNumber.output(a.sum(b))
print "Subtract : "
ComplexNumber.output(a.subtract(b))
print "Multiply : "
ComplexNumber.output(a.multiply(b))
print "Divide : "
ComplexNumber.output(a.divide(b))



