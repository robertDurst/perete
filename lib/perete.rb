require "benchmark/ips"

class BenchmarkerTestRunner
  DIRECTORY = "benchmarks/previous_runs/"

  def execute_and_compare
    Dir["./benchmarks/*.rb"].each { |file| require file }
    Benchmarks.constants
      .select { |x| x != :Benchmarker }
      .each do |klass|
        puts "Benchmarking #{klass}"

        benchmark_object = eval("Benchmarks::#{klass}.new")

        benchmark_object.setup
        
        Benchmark.ips do |x|
          x.config(time: 30, warmup: 3, iterations: 1)

          x.report(klass) { benchmark_object.execute }
        end
        
        benchmark_object.teardown
      end
  end
end

module Benchmarks
  class Benchmarker
    def setup
      # puts "setup"
    end

    def teardown
      # puts "teardown"
    end

    def execute
      setup

      # puts "execute"
      execute_internal

      teardown
    end

    def execute_internal
    end
  end
end