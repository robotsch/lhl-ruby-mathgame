class Question
  
  def initialize
    @num1 = rand(3...30)
    @num2 = rand(3...30)
    @prompt = "What does #{num1} plus #{num2} equal?"
    @answer = num1 + num2
  end

  attr_accessor :num1, :num2, :prompt, :answer

end