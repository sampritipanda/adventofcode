input = 347991

t = input - 1
sq = Math.sqrt(t).floor

if sq % 2 == 1
  t -= sq*sq
  line = sq + 1

  if t < line
    x = sq/2 + 1
    y = -(sq/2) + t

    puts x.abs + y.abs
  else
    t -= line
    t += 1
    y = sq/2 + 1
    x = (sq/2 + 1) - t

    puts x.abs + y.abs
  end
else
  t -= sq*sq
  line = sq + 1

  if t < line
    x = -(sq/2)
    y = (sq/2) - t

    puts x.abs + y.abs
  else
    t -= line
    t += 1
    y = -(sq/2)
    x = -(sq/2) + t

    puts x.abs + y.abs
  end 
end
