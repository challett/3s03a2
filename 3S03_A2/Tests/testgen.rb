outfiles = ["test1.txt" , "test3.txt" , "test4.txt" , "test5.txt" , "test6.txt" , "test7.txt"]

outfiles.each do |i|
  #Start making input files
  infile = File.open i, "w"
  if i == "test1.txt"
    25.times do
      nextline = "t,e,"
      j = rand(20)
      nextline += "A" * j
      k = rand(20)
      nextline += "D" * k
      z = rand(20)
      nextline += "W" * z
      nextline += ",s,D"
      infile.puts nextline
    end
  elsif i == "test2.txt"

  elsif i == "test3.txt"
      51.times do
        nextline = "t,e,"
        j = rand(20)
        nextline += "A" * j
        k = rand(20)
        nextline += "D" * k
        z = rand(20)
        nextline += "W" * z
        nextline += ",s,D"
        infile.puts nextline
      end
  elsif (i == "test4.txt")
      50.times do
        nextline = "t,e,"
        j = rand(20)
        nextline += "A" * j
        k = rand(20)
        nextline += "D" * k
        z = rand(20)
        nextline += "W" * z
        nextline += ",s,D"
        infile.puts nextline
      end
  elsif (i == "test5.txt")
      10.times do
        nextline = "t,e,"
        nextline += "A" * (2**20 + 1)
        nextline += "D" * 5
        nextline += "W"
        nextline += ",s,D"
        infile.puts nextline
      end
  elsif (i == "test6.txt")
      10.times do
        nextline = "t,e,"
        nextline += "A" * (2**20)
        nextline += "D" * 5
        nextline += "W"
        nextline += ",s,D"
        infile.puts nextline
      end
    elsif i == "test7.txt"
      rand(50).times do
        nextline = "t,e,"
        j = rand(20)
        nextline += "A" * j
        k = rand(20)
        nextline += "D" * k
        z = rand(20)
        nextline += "W" * z
        nextline += ",s,D"
        infile.puts nextline
      end
      infile.close
  end
  puts("done creating test case")


  #Start making output files
  infile = File.open(i , "r")
  filedata = infile.readlines
  infile.close
  if i == "test1.txt"
    outfile = File.open("output1.txt" , "w")
  elsif i == "test2.txt"
    outfile = File.open("output2.txt" , "w")
  elsif i == "test3.txt"
    outfile = File.open("output3.txt" , "w")
  elsif i == "test4.txt"
    outfile = File.open("output4.txt" , "w")
  elsif i == "test5.txt"
    outfile = File.open("output5.txt" , "w")
  elsif i == "test6.txt"
    outfile = File.open("output6.txt" , "w")
  elsif i == "test7.txt"
    outfile = File.open("output7.txt" , "w")
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
      sixthirdentry = filedata[j+6][2]
    else
      sixthirdentry = "00"
    end
    a6num = sixthirdentry.count("A")
    d6num = sixthirdentry.count("D")
    w6num = sixthirdentry.count("W")
    outfile.puts(j.to_s + ", " + anum.to_s + ", " + dnum.to_s + ", " + wnum.to_s + ",      " + (j+6).to_s + ", " + a6num.to_s + ", " + d6num.to_s + ", " + w6num.to_s)
    if (j+1)%6 == 0 && j!=0 && j != 1
      outfile.puts("For the above 6 lines, the number of A: " + asum.to_s + " **** the number of D: " + dsum.to_s + " **** the number of W: " + wsum.to_s)
      asum = 0
      dsum = 0
      wsum = 0
    end
  end
  puts "Done creating output"
  outfile.close
end
