
# you can create a module inside another module as follows
defmodule Playgroud do
  def area(a, b) do
    a * b
  end
  def run do
    # the last line of the function is always the return value
    area(10, 10)
  end

  defmodule Students do
    def num_students do
      "There are #{15 + 34} students"
    end
  end
end


defmodule Circle do
  def diameter(d) do
    d / 2
  end
  # Single Line functions
  def paramater(r, z), do: r * z
end
