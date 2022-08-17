# Data Types in Elixir

   # Integers
x = 1 + 3
IO.puts(x)
# i x
# Term
#   4
# Data type
#   Integer
# Reference modules
#   Integer
# Implemented protocols
#   IEx.Info, Inspect, List.Chars, String.Chars


  # BitString (string in other programming languages)
y = 'hussein'
IO.puts(y)
#  i y
# Term
#   "hussein"
# Data type
#   BitString
# Byte size
#   7
# Description
#   This is a string: a UTF-8 encoded binary. It's printed surrounded by
#   "double quotes" because all UTF-8 encoded code points in it are printable.
# Raw representation
#   <<104, 117, 115, 115, 101, 105, 110>>
# Reference modules
#   String, :binary
# Implemented protocols
#   Collectable, IEx.Info, Inspect, List.Chars, String.Chars


   # FLoat
z = 2 / 4
IO.puts(z)
# i z
# Term
#   0.5
# Data type
#   Float
# Reference modules
#   Float
# Implemented protocols
#   IEx.Info, Inspect, List.Chars, String.Chars


  #  List
p = [1,2,3,'hello']
IO.puts(p)
# i p
# Term
#   [1, 2, 3, 'hello']
# Data type
#   List
# Reference modules
#   List
# Implemented protocols
#   Collectable, Enumerable, IEx.Info, Inspect, List.Chars, String.Chars
