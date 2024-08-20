module Enumerable   
  def my_each_with_index  
    if block_given?   
      index = 0 
      until index == self.length
        self.my_each do |element|
          yield(element,index) 
          index += 1
        end 
      end
    end 
    return self
  end 

  def my_select  
    results = []
    self.my_each do |element| 
      results << element if yield(element) 
    end
     return results
  end
  # my_each
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here 
  def my_each 
    if block_given?   
      i = 0
      until i == self.length do 
        yield(self[i]) 
        i += 1 
      end
    end
    return self
  end 


end
