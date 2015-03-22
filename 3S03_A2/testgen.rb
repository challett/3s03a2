outfiles = ["test1.txt" , "test3.txt" , "test4.txt"]

outfiles.each do |i|
  #Start making input files
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
  end
  puts("done creating test case")
  infile.close

  #Start making output files
  infile = File.open(i , "r")
  filedata = infile.readlines
  infile.close
  puts(filedata)
  if i == "test1.txt"
    outfile = File.open("output1.txt" , "w")
  elsif i == "test2.txt"
    outfile = File.open("output2.txt" , "w")
  elsif i == "test3.txt"
    outfile = File.open("output3.txt" , "w")
  elsif i == "test4.txt"
    outfile = File.open("output4.txt" , "w")
  end
  filedata.each_index do |j|
    filedata[j] = filedata[j].split(",")
  end
  asum = 0
  dsum = 0
  wsum = 0
  filedata.each_index do |j|
    thirdentry = filedata[j][2]
    anum = thirdentry.count("A")
    asum += anum
    dnum = thirdentry.count("D")
    dsum += dnum
    wnum = thirdentry.count("W")
    wsum += wnum
    if j+6 < filedata.length
      sixthirdentry = filedata[j+6]
    else
      sixthirdentry = "00"
    end
    a6num = sixthirdentry.count("A")
    d6num = sixthirdentry.count("D")
    w6num = sixthirdentry.count("W")
    puts("test")
    outfile.puts(j.to_s + ", " + anum.to_s + ", " + dnum.to_s + ", " + wnum.to_s + ",      " + (j+6).to_s + ", " + a6num.to_s + ", " + d6num.to_s + ", " + w6num.to_s)
    if j%6 == 0 && j!=0
      outfile.puts("For the above 6 lines, the number of A: " + asum.to_s + " **** the number of D: " + dsum.to_s + " **** the number of W: " + wsum.to_s)
      asum = 0
      dsum = 0
      wsum = 0
    end
  end
  puts "Done creating output"
  outfile.close
end
