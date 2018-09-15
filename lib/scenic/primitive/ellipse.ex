#
#  Created by Boyd Multerer on June 6, 2018.
#  Copyright © 2017 Kry10 Industries. All rights reserved.
#

defmodule Scenic.Primitive.Ellipse do
  use Scenic.Primitive

  # alias Scenic.Primitive
  #  alias Scenic.Primitive.Style

  @styles [:hidden, :fill, :stroke]

  # ============================================================================
  # data verification and serialization

  # --------------------------------------------------------
  def info(data),
    do: """
      #{IO.ANSI.red()}#{__MODULE__} data must be: {radius_1, radius_2}
      #{IO.ANSI.yellow()}Received: #{inspect(data)}
      #{IO.ANSI.default_color()}
    """

  # --------------------------------------------------------
  def verify(data) do
    case normalize(data) do
      :error -> :invalid_data
      data -> {:ok, data}
    end
  end

  # --------------------------------------------------------
  def normalize({r1, r2} = data) when is_number(r1) and is_number(r2) do
    data
  end

  def normalize(_), do: :error

  # ============================================================================
  def valid_styles(), do: @styles

  # --------------------------------------------------------
  def contains_point?({r1, r2}, {xp, yp}) do
    dx = xp * xp / (r1 * r1)
    dy = yp * yp / (r2 * r2)
    # test if less or equal to 1
    dx + dy <= 1
  end
end
