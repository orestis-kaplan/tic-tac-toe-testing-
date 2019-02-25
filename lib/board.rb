# class Board
class Board

  DIMENSION = 3
  WIN = 'win'
  DRAW = 'draw'
  ON_GAME = 'on_game'

  attr_reader :table, :size

  def initialize(size)
    @size = size < 3 ? DIMENSION : size # size never gets nil, at least it will be "" or 0 in our case
    @table = Array.new(@size)
    @size.times { |pos| @table[pos] = Array.new(@size) }
  end

  def table= (table)
    @table = table
  end

  def graphic_table
    counter = 0
    element = division = ""

    @table.each do |rows|
      element += rows.map{ |val|  val.nil? ? '-|' : "#{val}|" }.join
      element += "\n"
      division = "#{'-' * (@size * 2)} \n" if (counter % @size).zero?
      element += division
    end

    element
  end

  def fill_table(position, symbol)
    write_cell(position, symbol) if empty_position? position
  end

  def table_guide
    table_str = ""
    (1..@size**2).each do |num|
      table_str += "#{num}#{ ' ' * ((@size * @size).to_s.length - num.to_s.length) }|"
      if(num % @size).zero?
        table_str += "\n"
        table_str += "#{'-' * ((@size * @size).to_s.length * @size + @size)} \n"
      end
    end
    table_str
   end

   def check_rows
    for row in @table
      return WIN if row.uniq.size <= 1 && row.uniq != [nil]
    end
    ON_GAME
  end

  def check_columns
    column_matrix = []

    @size.times do |pos|
      column_matrix << @table.map do |rows|
        rows[pos]
      end
    end

    for column in column_matrix
      return WIN if column.uniq.size <= 1 && column.uniq != [nil]
    end
    ON_GAME
  end

  def check_main_diagonal
    main_diagonal = []

    main_diagonal = @table.map.with_index do |rows, i|
      rows[i]
    end

    return WIN if main_diagonal.uniq.size <= 1 && main_diagonal.uniq != [nil]

    ON_GAME
  end

  def check_second_diagonal
    second_diagonal = []

    second_diagonal = @table.map.with_index do |rows, i|
      rows[@size - i - 1]
    end

    return WIN if second_diagonal.uniq.size <= 1 && second_diagonal.uniq != [nil]

    ON_GAME
  end

  def draw
    if @table.flatten.none?{ |inner| inner.nil? }
      return DRAW
    end
    ON_GAME
  end

  def read_cell(position)
    if empty_position? position
      return true
    else
      return false
    end
  end

  private

  def position_coverter position
    row = col = 0

    for i in (1...position)
      if i % @size == 0
        row += 1
      end
    end
    [row, position - @size * row - 1]
  end

  def empty_position?(position)
    arr_pos = position_coverter position
    @table[arr_pos[0]][arr_pos[1]].nil?
  end

  def write_cell(position, symbol)
    arr_pos = position_coverter position
    @table[arr_pos[0]][arr_pos[1]] = symbol
  end

end
