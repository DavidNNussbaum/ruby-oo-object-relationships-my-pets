class Owner
  @@all = []
  attr_reader :name, :species
  attr_accessor :owner

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a human."
  end

  def self.all
    return @@all
  end

  def self.count
    return @@all.count
  end

  def self.reset_all
    return @@all.clear
  end

  def cats
    return Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    return Dog.all.select {|dog| dog.owner == self }
  end

  def buy_cat(name)
     Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.each {|dog| dog.mood = "nervous"} && self.cats.each {|cat| cat.mood = "nervous"}
  end

  def sell_pets
    pets = self.dogs + self.cats
    pets.each do |pet|
       pet.mood = "nervous" 
       pet.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

  end

end