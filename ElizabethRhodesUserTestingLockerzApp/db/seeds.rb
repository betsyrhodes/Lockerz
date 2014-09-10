1000.times do |n|
  Locker.create(
    size: "small",
    number: 1 + n
  )
end

1000.times do |n|
  Locker.create(
    size: "medium",
    number: 2001 + n
  )
end

1000.times do |n|
  Locker.create(
    size: "large",
    number: 3001 + n
  )
end

