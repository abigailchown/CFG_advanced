name = "Charlie"
age = 10
years = 1

until years == 20

	puts "In #{years} years #{name} will be #{age + years} years old."
	years+=1
end

name = "Charlie"
age = 10
years = 1

1.upto(25) {|i|
	puts "In #{i} years #{name} will be #{i + age} years old."
}