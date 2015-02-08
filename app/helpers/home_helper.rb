module HomeHelper

  def class_for_index(index)
    case index % 6
    when 0
      "big"
    when 1, 2
      "small"
    when 3
      "big2"
    when 4, 5
      "small2"
    end
  end

end
