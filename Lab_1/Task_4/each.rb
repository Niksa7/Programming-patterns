class Array

  def each
    index = 0
    while index < self.length
      yield self[index]
      index += 1
    end
  end
end

yesyesyes = [1, 5, 7, 15, 99]
yesyesyes.each {|x| puts x}
