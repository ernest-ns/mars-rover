load 'rover.rb'

describe "Rover" do
  before(:each) do
    @max_size_of_plateau = {:x => 5, :y => 5}
    @initial_position_of_rover = {:x => 1, :y => 2 ,:direction => 'N'}   
    @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)     
  end
  describe "given the max_x and max_y and the initial position of the rover" do    
    context "and given the instructions to the rover" do
      it "should return the final position of the rover" do
        instruction_set = "LMLMLMLMM"
        @mars_rover.calculate_final_position(instruction_set).should eql({:x => 1, :y => 3, :direction => 'N'})

        @initial_position_of_rover = {:x => 3, :y => 3 ,:direction => 'E'}
        @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)     
        instruction_set = "MMRMMRMRRM"
        @mars_rover.calculate_final_position(instruction_set).should eql({:x => 5, :y => 1, :direction => 'E'})
      end
    end
  end
  describe "Given the current position and the instruction should return the next position" do
    before(:each) do
    end

    describe "Instruction is L" do
      context "if current position is 0, 0, N" do
        it "should return the next position as 0, 0, W" do
          @initial_position_of_rover = {:x => 0, :y => 0 ,:direction => 'N'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('L')
          @mars_rover.current_position_of_rover.should eql({:x => 0, :y => 0, :direction => 'W'})
        end
      end

      context "if current position is 0, 0, W" do
        it "should return the next position as 0, 0, S" do
          @initial_position_of_rover = {:x => 0, :y => 0 ,:direction => 'W'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('L')
          @mars_rover.current_position_of_rover.should eql({:x => 0, :y => 0, :direction => 'S'})
        end
      end

      context "if current position is 0, 0, S" do
        it "should return the next position as 0, 0, E" do
          @initial_position_of_rover = {:x => 0, :y => 0 ,:direction => 'S'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('L')
          @mars_rover.current_position_of_rover.should eql({:x => 0, :y => 0, :direction => 'E'})
        end
      end

      context "if current position is 0, 0, E" do
        it "should return the next position as 0, 0, N" do
          @initial_position_of_rover = {:x => 0, :y => 0 ,:direction => 'E'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('L')
          @mars_rover.current_position_of_rover.should eql({:x => 0, :y => 0, :direction => 'N'})
        end
      end
    end

    describe "Instruction is R" do
      context "if current position is 0, 0, N" do
        it "should return the next position as 0, 0, E" do
          @initial_position_of_rover = {:x => 0, :y => 0 ,:direction => 'N'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('R')
          @mars_rover.current_position_of_rover.should eql({:x => 0, :y => 0, :direction => 'E'})
        end
      end

      context "if current position is 0, 0, W" do
        it "should return the next position as 0, 0, N" do
          @initial_position_of_rover = {:x => 0, :y => 0 ,:direction => 'W'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('R')
          @mars_rover.current_position_of_rover.should eql({:x => 0, :y => 0, :direction => 'N'})
        end
      end

      context "if current position is 0, 0, S" do
        it "should return the next position as 0, 0, W" do
          @initial_position_of_rover = {:x => 0, :y => 0 ,:direction => 'S'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('R')
          @mars_rover.current_position_of_rover.should eql({:x => 0, :y => 0, :direction => 'W'})
        end
      end

      context "if current position is 0, 0, E" do
        it "should return the next position as 0, 0, S" do
          @initial_position_of_rover = {:x => 0, :y => 0 ,:direction => 'E'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('R')
          @mars_rover.current_position_of_rover.should eql({:x => 0, :y => 0, :direction => 'S'})
        end
      end
    end
    describe "Instruction is M" do
      context "if current position is 0, 0, N" do
        it "should return the next position as 0, 1, N" do
          @initial_position_of_rover = {:x => 0, :y => 0 ,:direction => 'N'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('M')
          @mars_rover.current_position_of_rover.should eql({:x => 0, :y => 1, :direction => 'N'})
        end
      end

      context "if current position is 2, 3, W" do
        it "should return the next position as 1, 3, W" do
          @initial_position_of_rover = {:x => 2, :y => 3 ,:direction => 'W'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('M')
          @mars_rover.current_position_of_rover.should eql({:x => 1, :y => 3, :direction => 'W'})
        end
      end

      context "if current position is 2, 3, S" do
        it "should return the next position as 2, 2, S" do
          @initial_position_of_rover = {:x => 2, :y => 3 ,:direction => 'S'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('M')
          @mars_rover.current_position_of_rover.should eql({:x => 2, :y => 2, :direction => 'S'})
        end
      end

      context "if current position is 2, 3, E" do
        it "should return the next position as 2, 4, E" do
          @initial_position_of_rover = {:x => 2, :y => 3 ,:direction => 'E'}
          @mars_rover = Rover.new(@max_size_of_plateau, @initial_position_of_rover)
          @mars_rover.update_position('M')
          @mars_rover.current_position_of_rover.should eql({:x => 3, :y => 3, :direction => 'E'})
        end
      end
    end
  end
end
