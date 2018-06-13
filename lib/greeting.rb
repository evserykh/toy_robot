class Greeting
  def to_s
    [
      '###########################',
      '### Toy Robot Simulator ###',
      '###########################',
      '',
      'Available commands:',
      '',
      '* PLACE X,Y,F (will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST)',
      '* MOVE        (will move the toy robot one unit forward in the direction it is currently facing)',
      '* LEFT, RIGHT (will rotate the robot 90 degrees in the specified direction without changing the position of the robot)',
      '* REPORT      (will announce the X,Y and F of the robot)',
      '',
      'For more details, visit https://github.com/askcharlie/toy_robot',
      '',
      'Press CTRL-C for exit',
      ''
    ].join("\n")
  end
end
