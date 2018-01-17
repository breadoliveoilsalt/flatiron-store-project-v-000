module ShowHelper

  def number_to_currency(num)
    "$%.2f" % (num/100.to_f)
  end

end
