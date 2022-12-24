defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """
  def main(input) do
    input |> hash_input |> pick_color |> build_grid |> filter_odd_squares |> build_pixel_map |> draw_image |> save_image(input)
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input) |> :binary.bin_to_list
    %ImageStruct{hex: hex}
  end

  def pick_color(image) do
    # %Identicon.Image{hex: hex_list} = image
    # [r, g, b | _tail] = hex_list
    # [r, g, b]
    # or you can do this
    %ImageStruct{hex: [r, g, b | _tail]} = image
    %ImageStruct{image | color: {r, g, b}}
  end

  def build_grid(%ImageStruct{hex: hex} = image) do
    grid = hex |> Enum.chunk(3) |> Enum.map(&mirror_row/1) |> List.flatten |> Enum.with_index
    %ImageStruct{image | grid: grid}
  end

  def mirror_row(row) do
    # [134, 72, 200]
    [first, second | _tail] = row
    # [134, 72, 200, 72, 134]
    row ++ [second , first]
  end

  def filter_odd_squares(%ImageStruct{grid: grid} = image) do
    new_grid = Enum.filter grid, fn({code, _index}) ->
                rem(code, 2) == 0
              end
    %ImageStruct{image | grid: new_grid}
  end

  def build_pixel_map(%ImageStruct{grid: grid} = image) do

    pixel_map = Enum.map grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

      {top_left, bottom_right}
    end

    %ImageStruct{image | pixel_map: pixel_map}
  end

  def draw_image(%ImageStruct{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color)

    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end

    :egd.render(image)

  end

  def save_image(image, input) do
    File.write("#{input}.png", image)
  end

end
