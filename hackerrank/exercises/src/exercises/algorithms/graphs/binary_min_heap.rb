class BinaryMinHeap
  attr_reader :swaps
  def initialize(maxSize, data = [])
    @data = [0] + data
    @size = @data.size() -1
    @maxSize = maxSize +1
    @swaps = []
  end

  def data(i = nil)
    if i.nil?
      @data[1,@size]
    else
      @data[i]
    end
  end

  def print_swaps
    puts @swaps.length
    @swaps.each do |(l,r)|
      puts "#{l} #{r}"
    end
  end

  def extractMin
    result = @data[1]
    @data[1] = @data[@size]
    @size -= 1
    siftDown(1)
    result
  end

  # p: priority or just the value of the node
  def insert(p)
    raise "No remaining space" if @size == @maxSize
    @size += 1
    @data[@size] = p
    siftUp(@size)
  end

  def remove(i)
    @data[i] = Float::INFINITY
    siftUp(i)
    extractMin
  end

  def changePriority(i, p)
    oldp = @data[i]
    @data[i] = p
    if(p > oldp)
      siftDown(i)
    else
      siftUp(i)
    end
  end

  def self.fromArray(arr)
    heap = new(arr.length, arr)
    (arr.length()/2 ).downto(1).each do |i|
      # puts "+++++++++++"
      # puts "sifting down #{heap.data(i)}"
      # puts heap.data.inspect

      heap.siftDown(i)

      # puts "after sifting down #{heap.data(i)}"
      # puts heap.data.inspect
      # puts "+++++++++++"
    end
    heap
  end

  def self.heapSort(arr)
    heap = fromArray(arr)
    result = (1..(arr.length)).map do |i|
      heap.extractMin
    end
    # puts result.inspect
    result
  end

  # int devision to automatically floor the value
  def parent(i)
    i/2
  end

  def leftChild(i)
    2*i
  end

  def rightChild(i)
    2*i +1
  end

  def siftUp(i)
    # while we are not the first element and
    # the parent value is smaller than our value
    while(i>1 && @data[parent(i)] > @data[i] ) do
      swap(parent(i), i)
      i = parent(i)
    end
  end

  def swap(i,j)
    @swaps << [ i -1 , j -1 ]
    # puts "swapping #{@data[i]} and #{@data[j]}"
    # puts "swapping positions #{i} and #{j}"
    @data[i], @data[j] = @data[j], @data[i]
  end

  def siftDown(i)
    minIndex = i
    l = leftChild(i)
    if l <= @size && @data[l] < @data[minIndex]
      minIndex = l
    end

    r = rightChild(i)
    if r <= @size && @data[r] < @data[minIndex]
      minIndex = r
    end

    if i != minIndex
      swap(i, minIndex)
      siftDown(minIndex)
    end
  end
end

_ = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)
# puts BinaryMinHeap.heapSort(arr).join(" ")
heap = BinaryMinHeap.fromArray(arr)
heap.print_swaps
