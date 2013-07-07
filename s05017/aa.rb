@building = [
  [33,3], [90,38], [72,21], [81,70],
  [50,90], [44,64], [35,31], [67,46],
  [67,80], [78,28]
]

@pre_calcuated_front = %w[0.0 66.89 42.95 82.42 88.65 61.98 28.07 54.82 84.17 51.48]
@pre_calcuated_back = %w[51.48 15.62 9.22 42.11 68.03 49.52 43.10 21.10 53.15 0.0]

@chromosome = Array.new(16)
=begin
  Structure of @chromosome array is..

  [city1, city2, city3, ... , total_length], ...

  For example, 
  [1, 2, 3, 4, 5, 6, 7, 8, length1],
  [2, 1, 3, 5, 4, 6, 8, 7, length2],
  [2, 1, 3, 4, 5, 6, 8, 7, length3], ...

  Let's put the length of path at the last point of Array(@chromosome).
=end

def init
  0.upto(@chromosome.size - 1) do |x|
    @chromosome[x] = (1..8).to_a.shuffle        #[2,1,4,3,5,6,7,8]
    @chromosome[x] << get_length(@chromosome[x])#[2,1,4,3,5,6,7,8,length]
  end
end

def sort
  @chromosome.sort! {|x, y| x[-1] <=> y[-1]} #compare the last value of array
end

def marry
  cutting_point = 10  #Select top 10 chromosome.
  cutting_point.upto(@chromosome.size - 1) do |x|
    @chromosome[x] =                            #new child is comming from .. 
      @chromosome[rand(cutting_point)][0...4] + #mother [2,1,4,3]
      @chromosome[rand(cutting_point)][4...8]   #father [2,1,4,3] + [2,5,6,7]
                                    
                                                #add meaningless value.
    @chromosome[x] << 9999999                   #[2,1,4,3,2,5,6,7,9999999]
                                                #9999999 is a phantom value.
  end
end

def fix
  0.upto(@chromosome.size - 1) do |x|
    if @chromosome[x].uniq.size < 9 # [1,2,3,4,5,6,1,1,9999999]
      @chromosome[x].delete_at(-1)  # [1,2,3,4,5,6,1,1]
      @chromosome[x].uniq!          # [1,2,3,4,5,6] 
      new_array = (1..8).to_a.shuffle - @chromosome[x] #[[7,8]]
      @chromosome[x] << new_array   # [1,2,3,4,5,6,[7,8]]
      @chromosome[x].flatten!       # [1,2,3,4,5,6,7,8]
      @chromosome[x] << get_length(@chromosome[x])
                                    # [1,2,3,4,5,6,7,8,actual_length]
    end
  end
end

def mutation
  0.upto(@chromosome.size-1) do |x|
    0.upto(2) do |y|                  # [4,3,2,1,8,7,6,5,length]
      point1 = rand(8)                # point1 = 3
      point2 = rand(8)                # point2 = 7
      temp = @chromosome[x][point1]   # swap beween chromosome[3] and [7]
      @chromosome[x][point1] = @chromosome[x][point2] 
      @chromosome[x][point2] = temp   # [4,3,2,5,8,7,6,1,length]

      @chromosome[x].delete_at(-1)    # [4,3,2,5,8,7,6,1]
      @chromosome[x] << get_length(@chromosome[x]) #[4,3,2,5,8,7,6,1,length]
    end
  end
end

def get_length path #This function is based on math.
  total = 0
  total = total + 
    @pre_calcuated_front[path[0]].to_f + 
    @pre_calcuated_back[path[7]].to_f

  0.upto(6) do |x|
    total = total + 
      Math.sqrt(
        ((@building[path[x]][0] - @building[path[x+1]][0]) ** 2) + 
        ((@building[path[x]][1] - @building[path[x+1]][1]) ** 2)
      )
  end
  return total
end


#let's begin functions!
init
total_optimal_path = @chromosome[0][0..-1] #initialiez.

loop do 
  sort

  if total_optimal_path[-1] > @chromosome[0][-1]
    total_optimal_path = @chromosome[0][0..-1]
  end
  puts total_optimal_path.inspect

  marry 
  fix
  mutation
end
