class Rover
  attr_accessor :max_size_of_plateau, :initial_position_of_rover, :current_position_of_rover
  @@directionHash = {
    :N_L => "W",
    :W_L => "S",
    :S_L => "E",
    :E_L => "N",
    :N_R => "E",
    :W_R => "N",
    :S_R => "W",
    :E_R => "S",
    :N_M => "N",
    :W_M => "W",
    :S_M => "S",
    :E_M => "E"
  }
  def initialize max_size_of_plateau, initial_position_of_rover
    @max_size_of_plateau = max_size_of_plateau
    @initial_position_of_rover = initial_position_of_rover
    @current_position_of_rover = @initial_position_of_rover
  end
  
  def update_position instruction

    direction = @@directionHash["#{self.current_position_of_rover[:direction]}_#{instruction}".to_sym]
    self.current_position_of_rover[:direction] = direction

    if instruction == 'M' && self.current_position_of_rover[:direction] == "N"
      self.current_position_of_rover[:y] = self.current_position_of_rover[:y] + 1
    end
    if instruction == 'M' && self.current_position_of_rover[:direction] == "S"
      self.current_position_of_rover[:y] = self.current_position_of_rover[:y] - 1
    end
    if instruction == 'M' && self.current_position_of_rover[:direction] == "W"
      self.current_position_of_rover[:x] = self.current_position_of_rover[:x] - 1
    end
    if instruction == 'M' && self.current_position_of_rover[:direction] == "E"
      self.current_position_of_rover[:x] = self.current_position_of_rover[:x] + 1
    end    
  end
  def calculate_final_position(instruction_set)
    instruction_set = instruction_set.split(//)
    instruction_set.each do  |instruction|
      self.update_position instruction
    end
    self.current_position_of_rover
  end
end
