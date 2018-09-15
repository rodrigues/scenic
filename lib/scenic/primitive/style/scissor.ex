#
#  Created by Boyd Multerer on June 6, 2018.
#  Copyright © 2018 Kry10 Industries. All rights reserved.
#

defmodule Scenic.Primitive.Style.Scissor do
  use Scenic.Primitive.Style

  # ============================================================================
  # data verification and serialization

  # --------------------------------------------------------
  def info(data),
    do: """
      #{IO.ANSI.red()}#{__MODULE__} data must be {width, height}
      #{IO.ANSI.yellow()}Received: #{inspect(data)}

      "The scissor region will be positioned by the transform stack"

      #{IO.ANSI.default_color()}
    """

  # --------------------------------------------------------
  # named color

  def verify(data) do
    case normalize(data) do
      :error -> false
      _ -> true
    end
  end

  # --------------------------------------------------------

  def normalize({w, h}) when is_number(w) and is_number(h) do
    {w, h}
  end

  def normalize(_), do: :error
end
