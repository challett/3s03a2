outfiles = ["test1.txt" , "test2.txt" , "test3.txt" , "test4.txt"]

outfiles.each do |i|
  infile = File.open(i, "w")
  if (i == "test1.txt")
    25.times do
      nextline = "t,e,"
      j = rand(20)
      j.times do
        nextline += "A"
      k = rand(20)
      k.times do
        nextline += "D"
      z = rand(20)
      z.times do
        nextline += "W"
      nextline += ",s,D"
      infile.puts nextline
  else if (i == "test2.txt")

  else if (i == "test3.txt")
      51.times do
        nextline = "t,e,"
        j = rand(20)
        j.times do
          nextline += "A"
        k = rand(20)
        k.times do
          nextline += "D"
        z = rand(20)
        z.times do
          nextline += "W"
        nextline += ",s,D"
        infile.puts nextline
  else if (i == "test4.txt")
      50.times do
        nextline = "t,e,"
        j = rand(20)
        j.times do
          nextline += "A"
        k = rand(20)
        k.times do
          nextline += "D"
        z = rand(20)
        z.times do
          nextline += "W"
        nextline += ",s,D"
        infile.puts nextline
  infile.close
puts("done")
