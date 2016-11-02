class Person
	def initialize(firstName, lastName, id)
		@firstName = firstName
		@lastName = lastName
		@id = id
	end
	def printPerson()
		print("Name: ",@lastName , ", " + @firstName ,"\nID: " , @id)
	end
end


class Student <Person
  SCORES = {
    O: (90..100),
    E: (80...90),
    A: (70...80),
    P: (55...70),
    D: (40...55),
    T: (0...40)
  }

  def initialize(first, last, id, scores)
    @scores = scores
    super(first, last, id)
  end

  def calculate()
    n = @scores.length
    avg = @scores.reduce(&:+) / n

    SCORES.detect do |_k,v|
      v.cover?(avg)
    end.first.to_s
  end
end


input = gets.split()
firstName = input[0]
lastName = input[1]
id = input[2].to_i
numScores = gets.to_i
scores = gets.strip().split().map!(&:to_i)
s = Student.new(firstName, lastName, id, scores)
s.printPerson
print("\nGrade: " + s.calculate)
