#
#  Created by Boyd Multerer on 10/03/17.
#  Copyright © 2017 Kry10 Industries. All rights reserved.
#

defmodule Scenic.Primitive.Transform.Pin do
  use Scenic.Primitive.Transform

  # ============================================================================
  # data verification and serialization

  # --------------------------------------------------------
  def info(data),
    do: """
      #{IO.ANSI.red()}#{__MODULE__} data must be a 2d vector: {x,y}
      #{IO.ANSI.yellow()}Received: #{inspect(data)}
      #{IO.ANSI.default_color()}
    """

  # --------------------------------------------------------
  def verify(percent) do
    case normalize(percent) do
      :error -> false
      _ -> true
    end
  end

  # --------------------------------------------------------
  # normalize named stipples
  def normalize({x, y}) when is_number(x) and is_number(y), do: {x, y}
  def normalize(_), do: :error
end
