class Greeter
  def greet
    smiley = Smiley.new
    "Hello #{smiley.get}"
  end
end

class Smiley
  def get
    ":)"
  end
end

# ~ Greeter.new
# ~ greeter.greet
# => "Hello :)"


# Smiley has no dependencies, so we can test it like this...

it "returns a smiley" do
  smiley = Smiley.new
  expect(smiley.get).to eq ":)"
end

# But Greeter dependes on Smiley, and there's no easy way of separating them.
# The dependency is hardcoded.
# Greeter is tightly coupled to Smiley.

# We can't call Greeter#greet without calling Smiley#get.
# That means if Smiley breaks, then our tests for Greeter break,
# even when Greeter is doing exactly what it is supposed to.
# This makes it harder to track down bugs.


# Rearranging the code like this...

class Greeter
  def initialize(smiley = Smiley.new)
    @smiley = smiley
  end

  def greet
    "Hello #{@smiley.get}"
  end
end

class Smiley
  def get
    ":)"
  end
end

# allows us to test the code like this...

# greeter_spec.rb
describe Greeter do
  describe "#greet" do
    it "prints a message and a smiley" do
      smiley_double = double :smiley, get: ":D" # <- what is this syntax? what is returned by :smiley? think it replaces the @smiley var in Greeter initializer
      greeter = Greeter.new(smile_double)
      expect(greeter.greet).to eq "Hello :D"
    end
  end
end

# smiley_spec.rb
describe Smiley do
  describe "#get" do
    it "returns a smiley" do
      smiley = Smiley.new
      expect(smiley.get).to eq ":)"
    end
  end
end

