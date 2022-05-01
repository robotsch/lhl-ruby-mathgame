class Player

  def initialize(name)
    @name = name
    @lives = 3
    @answer = 0
  end

  attr_accessor :name, :lives, :answer

end