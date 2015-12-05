module Enumerable
  def my_each
    i=0
    while i < self.size
      yield(self[i])
      i+=1
    end
    self
  end
  
  def my_select
    self.my_each do |z|
      if yield(z)
        puts z
      end
    end
  end
  
  def my_all?
    switch = true
    self.my_each do |z|
      if yield(z) == false
        switch = false
      end
    end
    return switch
  end
  
  def my_any?
    switch = false
    self.my_each do |z|
      if yield(z)
        switch = true
      end
    end
    return switch
  end
  
  def my_none?
    switch = true
    self.my_each do |z|
      if yield(z)
        switch = false
      end
    end
    return switch
  end
  
  def my_count
    count = 0
    self.my_each do |z|
      if yield(z)
        count += 1
      end
    end
    return count
  end
  
  def my_map
    array = []
    self.my_each do |z|
      array << yield(z)
    end
    return array
  end
  
  def my_inject
    i = 2
    holder0 = yield(self[0],self[1])
    if self.length > 2
      until i == self.length
        holder = yield(holder0,self[i])
        holder0 = holder
        i += 1
      end
      return holder
    else
      return holder0
    end
  end
  
  def multiply_els(array)
    array.my_inject {|x,y| x*y}
  end
end