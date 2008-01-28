class Array
  # returns the value after the given value. wraps around. defaults to first element in array.
  def after(value)
    return nil unless include? value
    self[(index(value).to_i + 1) % length]
  end
  
  # Added to support tab delimited format for response_to output 
  def to_tsv(columns, delim = "\t")
    str = ""
    columns.each do |col|
      str << col.name.to_s.titleize + delim
    end
    str << "\n"
    self.each do |object|
      columns.each do |col|
        str << object.send(col.name.to_s).to_s + delim if
        object.respond_to?(col.name.to_s)
      end
      str << "\n"
    end
    str
  end

  
end