require_relative "piece"
require_relative "null_piece"

class Board 



  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate_board
  end

  def [](pos) #[1, 2]
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate_board
    # pawns
    (0..7).each { |n| @grid[1][n] = Piece.new("pawn", [1, n]) }
    (0..7).each { |n| @grid[6][n] = Piece.new("pawn", [6, n]) }
    # other pieces
    main_pieces = %w(rook knight bishop queen king bishop knight rook)
    main_pieces.each_with_index { |piece, idx| @grid[0][idx] = Piece.new(piece, [0, idx]) }
    main_pieces.each_with_index { |piece, idx| @grid[7][idx] = Piece.new(piece, [7, idx]) }
  end

  def move_piece(start_pos, end_pos)
    current_piece = self[start_pos]
    # raise if NullPiece === current_piece || self[end_pos].class != NullPiece 
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

end