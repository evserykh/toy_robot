class Table
  attr_reader :rows, :columns

  def initialize(rows: 5, columns: 5)
    @rows = rows
    @columns = columns
  end

  def include?(row, column)
    return false if row.negative? || column.negative?
    return false if exceeded?(row, rows) || exceeded?(column, columns)
    true
  end

  private

  def exceeded?(value, max)
    value >= max
  end
end
