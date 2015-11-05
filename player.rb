class Player
  attr_accessor :name, :manna, :blood
  
  def initialize(nama)
    @name = nama
    @blood = 100
    @manna = 40
  end
end
