# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# Given an integer `n` indicating the number of lights
# Create a hash that store the light number and a true/false value whether it is on or not
  # There are n keys and all values are initially set to false
# Loop n times:
  # Set round = current round (1-n)
  # Find keys that value a numeric value that is a multiple of round.
    # Toggle their value to be the opposite of its current value
# Return array of keys that have a true value

def toggle_lights(n)
  lights = (1..n).to_a.each_with_object({}) { |num, hash| hash[num] = false }

  1.upto(n) do |round|
    lights.each do |light_num, status|
      lights[light_num] = !status if light_num % round == 0
    end
  end

  lights.select { |_, status| status }.keys
end
