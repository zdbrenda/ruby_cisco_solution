gem 'test-unit'
require_relative "main"
require "test/unit"

class TestMain < Test::Unit::TestCase
    def setup
        @wc_empty=WordCounter.new("empty.txt")
        @wc_n_e=WordCounter.new("nonexistent.txt")
        @wc_nil=WordCounter.new
        @wc_long=WordCounter.new("long.txt")
        @wc_super_long=WordCounter.new("super_long.txt")
        @wc_new=WordCounter.new("new.txt")

    end
    # test return type of count
    def test_count_return_type
        assert_instance_of(String, @wc_empty.count)
        assert_instance_of(String, @wc_n_e.count)
        assert_instance_of(String, @wc_nil.count)
        assert_instance_of(Hash, @wc_long.count)
        assert_instance_of(Hash, @wc_super_long.count)
        assert_instance_of(Hash, @wc_new.count)
    end

    # test return value of count
    def test_count_return_value
        assert_equal("The file empty.txt is empty.",@wc_empty.count)
        assert_equal("Sorry, the file name you entered nonexistent.txt doesn't exist.",@wc_n_e.count)
        assert_equal("You didn't enter a valid file name. Please double check.",@wc_nil.count)

        assert_equal(@wc_long.count["apple"],2000)
        assert_equal(@wc_long.count["orange"],3000)
        assert_equal(@wc_long.count["banana"],1000)
        assert_not_include(@wc_long.count.keys,"pear")
        assert_not_include(@wc_long.count.keys,"kiwi")

        assert_equal(@wc_super_long.count["apple"],20000000)
        assert_equal(@wc_super_long.count["orange"],30000000)
        assert_equal(@wc_super_long.count["banana"],10000000)
        assert_not_include(@wc_super_long.count.keys,"pear")
        assert_not_include(@wc_super_long.count.keys,"kiwi")

        assert_equal(@wc_new.count["green"], 3)
        assert_equal(@wc_new.count["yellow"], 3)
        assert_equal(@wc_new.count["red"], 2)
        assert_equal(@wc_new.count["blue"], 2)
        assert_not_include(@wc_new.count.keys, "pink")

    end

    # test return type of process_output
    def test_process_output_return_type
        assert_instance_of(String, @wc_empty.process_output(@wc_empty.count))
        assert_instance_of(String, @wc_n_e.process_output(@wc_n_e.count))
        assert_instance_of(String, @wc_nil.process_output(@wc_nil.count))
        assert_instance_of(String, @wc_long.process_output(@wc_long.count))
        assert_instance_of(String, @wc_super_long.process_output(@wc_super_long.count))
        assert_instance_of(String, @wc_new.process_output(@wc_new.count))
    end

    # test return value of process_output
    def test_process_output_return_value
        assert_equal("The file empty.txt is empty.",@wc_empty.process_output(@wc_empty.count))
        assert_equal("Sorry, the file name you entered nonexistent.txt doesn't exist.",@wc_n_e.process_output(@wc_n_e.count))
        assert_equal("You didn't enter a valid file name. Please double check.",@wc_nil.process_output(@wc_nil.count))
        

        assert_include(@wc_long.process_output(@wc_long.count),"apple,2000")
        assert_include(@wc_long.process_output(@wc_long.count),"orange,3000")
        assert_include(@wc_long.process_output(@wc_long.count),"banana,1000")
        assert_not_include(@wc_long.process_output(@wc_long.count),"banana,2000")

        assert_include(@wc_super_long.process_output(@wc_super_long.count),"apple,20000000")
        assert_include(@wc_super_long.process_output(@wc_super_long.count),"orange,30000000")
        assert_include(@wc_super_long.process_output(@wc_super_long.count),"banana,10000000")
        assert_not_include(@wc_super_long.process_output(@wc_super_long.count),"banana,200000")

        assert_include(@wc_new.process_output(@wc_new.count),"yellow,3")
        assert_include(@wc_new.process_output(@wc_new.count),"green,3")
        assert_include(@wc_new.process_output(@wc_new.count),"red,2")
        assert_include(@wc_new.process_output(@wc_new.count),"blue,2")
        assert_not_include(@wc_new.process_output(@wc_new.count),"blue,3")
    end

    


end






