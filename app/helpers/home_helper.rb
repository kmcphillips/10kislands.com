module HomeHelper

  def class_for_index(index)
    klass = if index % 3 == 0
      "big"
    else
      "small"
    end

    klass << ((index / 3) + 1).to_s if index >= 3

    klass
  end

end
