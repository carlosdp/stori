module AuthorsHelper
  def format_phone(number)
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end
