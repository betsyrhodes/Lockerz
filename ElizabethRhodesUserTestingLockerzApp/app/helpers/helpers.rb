helpers do

  def find_available_locker(size)
    available_locker = find_locker_by_size(size)
    if !available_locker && size == "small"
      size = "medium"
      available_locker = find_locker_by_size(size)
    end
    if !available_locker && size == "medium"
      size = "large"
      available_locker = find_locker_by_size(size)
    end
    available_locker
  end

  def find_locker_by_size(size)
    Locker.where(size: size).where(full: false).first
  end

end


