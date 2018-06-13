# Toy Robot Simulator

A solution for [Toy Robot Simulator](https://github.com/askcharlie/toy_robot).

## Requirements

* Ruby 2.3+

## How To Run

Clone the repo:

`$ git clone https://github.com/evserykh/toy_robot && cd toy_robot`

Run the simulator:

`$ bin/simulator`

### To run RSpec or RuboCop

Install required gems first:

`$ bundle`

Then either

`$ rspec`

or

`$ rubocop`

## If You Use Docker

Clone the repo:

`$ git clone https://github.com/evserykh/toy_robot && cd toy_robot`

Run the simulator:

`$ docker run --rm -it -v $(pwd):/app -w /app ruby:2.5 bin/simulator`

### To run RSpec or RuboCop

Install required gems first:

`$ docker run --rm -it -v $(pwd):/app -v $(pwd)/.bundle:/usr/local/bundle -w /app ruby:2.5 bundle`

Then either

`$ docker run --rm -it -v $(pwd):/app -v $(pwd)/.bundle:/usr/local/bundle -w /app ruby:2.5 rspec`

or

`$ docker run --rm -it -v $(pwd):/app -v $(pwd)/.bundle:/usr/local/bundle -w /app ruby:2.5 rubocop`

## Showcase

[![asciicast](https://asciinema.org/a/SiSlkRG4WApou9AJ3ulTEfeVM.png)](https://asciinema.org/a/SiSlkRG4WApou9AJ3ulTEfeVM)
