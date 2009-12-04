require 'prime'
# A parallel WordCount. Depends on the 'wc' utility. 
class PrimeCalculation < CloudCrowd::Action
  
  def split
    
    r = input.split(",")
    r = r[0].to_i..r[1].to_i
    
    nw = options["workers"]
    
    ranges = nw.times.map{|k| k}.inject([]) { |f,n| binsz=(r.max-r.min)/nw; f+[(r.min+(binsz*n))..(r.min+binsz*(n+1)-1+(n==nw-1 ? 1 : 0))]}
    
    arr = ranges.map do |range|
      "#{range.min},#{range.max}"
    end
    
    # inputs = ["100,125","126,150","151,175","176,200"]
  end
  
  # Count the words in a single book.
  def process
    range = input.split(",")
    range = range[0].to_i..range[1].to_i
    
    results = []
    
    range.each do |number|
      results << number if number.prime?
    end
    
    return results.count
  end
  
  # Sum the total word count.
  def merge
    input
  end
  
end