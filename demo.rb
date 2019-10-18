require_relative "main"

if __FILE__ ==$0
    #create the object
    wc_empty =WordCounter.new("empty.txt")
    #create the counter
    counter_empty=wc_empty.count
    # display the output
    puts wc_empty.process_output(counter_empty)

    #create the object
    wc_ne =WordCounter.new("nonexistent.txt")
    #create the counter
    counter_ne=wc_ne.count
    # display the output
    puts wc_ne.process_output(counter_ne)



    # create a long text file for testing purpose

    # file=File.open("long.txt","w")
    # file.puts("apple,"*1000+"orange,"*2000+"banana,"*1000+"orange,"*1000+"apple,"*1000)
    # file.close

    wc_long=WordCounter.new("long.txt")
    counter_long=wc_long.count
    puts wc_long.process_output(counter_long)

    # create a super long text file for testing purpose

    # file_sl=File.open("super_long.txt","w")
    # file_sl.puts("apple,"*10000000+"orange,"*20000000+"banana,"*10000000+"orange,"*10000000+"apple,"*10000000)
    # file_sl.close

    wc_super_long=WordCounter.new("super_long.txt")
    counter_super_long=wc_super_long.count
    puts wc_super_long.process_output(counter_super_long)
   
end