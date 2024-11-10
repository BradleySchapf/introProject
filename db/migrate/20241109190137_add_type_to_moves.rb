class AddTypeToMoves < ActiveRecord::Migration[8.0]
  def change
    add_reference :moves, :type, null: false, foreign_key: true
  end
end
