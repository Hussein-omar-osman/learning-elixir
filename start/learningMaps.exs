

    #  Maps are dictionary or objects in other programming languages
# Maps do not keep the order you put things

my_map = %{'key' => 'value'}
IO.puts(my_map['key'])
# 'value'

person = %{'name' => 'hussein', 'score' => 99, 'status' => :ok, 'family' => ['hassan', 'qamar', 'ayub'], :key => 'some staff'}
IO.puts(person['name'])
IO.puts(person['score'])
IO.puts(person['status'])
IO.puts(person['family'])
IO.puts(person[:key])
# 'hussein'
# 99
# ok
# hassanqamarayub
# 'some staff'



      #  NESTED MAPS

school = %{'teacher' => 'ali', 'students' => %{'classA' => 'hussein', 'classB' => 'george'}}
IO.puts(school['students']['classA'])
IO.puts(school['students']['classB'])
# 'hussein'
# 'george'
