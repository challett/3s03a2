outfiles = ["test1.txt" , "test3.txt" , "test4.txt"]

outfiles.each do |i|
  infile = File.open i, "w"
  if i == "test1.txt"
    25.times do
      nextline = "t,e,"
      j = rand(20)
      j.times do
        nextline += "A"
      end
      k = rand(20)
      k.times do
        nextline += "D"
      end
      z = rand(20)
      z.times do
        nextline += "W"
      end
      nextline += ",s,D"
      infile.puts nextline
    end
  elsif i == "test2.txt"

  elsif i == "test3.txt"
      51.times do
        nextline = "t,e,"
        j = rand(20)
        j.times do
          nextline += "A"
        end
        k = rand(20)
        k.times do
          nextline += "D"
        end
        z = rand(20)
        z.times do
          nextline += "W"
        end
        nextline += ",s,D"
        infile.puts nextline
      end
  elsif (i == "test4.txt")
      50.times do
        nextline = "t,e,"
        j = rand(20)
        j.times do
          nextline += "A"
        end
        k = rand(20)
        k.times do
          nextline += "D"
        end
        z = rand(20)
        z.times do
          nextline += "W"
        end
        nextline += ",s,D"
        infile.puts nextline
      end
  infile.close
end
puts("done")
end
