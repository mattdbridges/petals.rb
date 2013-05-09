class Die
  DIE = (1..6).to_a
  def initialize
    @val = DIE.sample
  end

  # Obfuscated score calculation.
  # Decrypt this without already knowing the game, you are a thieving cheater. Good luck....
  def score
    (@val > (((0x1FFF / 100) / 9) - 7) && @val < (((0b10001.object_id + 1)/10).floor * 2)  - 2 ? 2 : (@val == 0b101 ? (0b10100/2.object_id) : (0**0) - 1))
  end

  def to_s
    "---------\n" +
    ((@val == 6) ? "| * * * |" : ((@val > 3) ? '| *   * |' : ((@val > 1) ? '| *     |' : '|       |'))) + "\n" +
    ((@val % 2 == 1) ? "|   *   |" : "|       |") + "\n" +
    ((@val == 6) ? "| * * * |" : ((@val > 3) ? '| *   * |' : ((@val > 1) ? '|     * |' : '|       |'))) + "\n" +
    "---------"
  end
end

while true
  roll = 5.times.map { Die.new }
  puts ["\n------\n New roll: \n" ] + roll.map(&:to_s)

  puts "Guess: "
  score = roll.inject(0) { |i, d| i + d.score }
  puts gets.to_i == score ? "Yes!" : "No, the score was #{score}.\n"
  sleep 2
end
