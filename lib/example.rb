class Garden
  attr_accessor :name

  def initialize(name:)
    @name = name
  end

  def plants
    Plant.all.select do |plant|
      plant.garden == self
    end
  end
end

class Plant
  attr_accessor :garden, :name

  @@all = []

  def initialize(name:)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
end

# we can call Garden.new b/c Garden is defined above
lawn = Garden.new(name: 'Front Lawn')

#we can call Plant.new b/c Plant is defined above
basil = Plant.new(name: 'Basil')
basil.garden = lawn

# we can associate a plant and a garden b/c both are defined above
cucumber = Plant.new(name: 'Cucumber')
cucumber.garden = lawn

p lawn.plants
# => [#<Plant:0x00007fa4440ab0c8 @name="Basil", @garden=#<Garden:0x00007fa4440997b0 @name="Front Lawn">>,
  #<Plant:0x00007fa4440b8bd8 @name="Cucumber", @garden=#<Garden:0x00007fa4440997b0 @name="Front Lawn">>] 