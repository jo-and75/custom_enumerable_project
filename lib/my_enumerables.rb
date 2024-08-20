module Enumerable   
  def my_each_with_index  
    if block_given?   
      index = 0 
      self.my_each do |element|
          yield(element,index) 
          index += 1
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

  def my_all? 
    results = [] 
    self.my_each do |element| 
      results << element if yield(element) 
    end 
    if results.length == self.length 
      return true 
    else 
      return false 
    end 
  end 

  def my_any?  
    results = []
    self.my_each do |element| 
      results << element if yield(element)
    end
    return true if results.length > 0  
    return false if results.length <= 0
  end 

  def my_none?  
    results = [] 
    self.my_each do |element| 
      results << element if yield(element) 
    end 
    return true if results.length <= 0 
    return false if results.length > 0
  end 

  def my_count  
    results = []
    if block_given? 
      self.my_each do |element| 
        results << element if yield(element) 
      end 
      return results.length  
    else 
      return self.length 
    end
  end
  
  def my_map 
    results = [] 
    if block_given? 
      self.my_each do |element| 
        results << yield(element) 
      end
    end 
    return results
  end 

  def my_inject(initial = nil)
    accumulator = initial.nil? ? self.first : initial
    start_index = initial.nil? ? 1 : 0
    
    self[start_index..-1].my_each_with_index do |element, index|
      accumulator = yield(accumulator, element)
    end    
    accumulator
  end


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
