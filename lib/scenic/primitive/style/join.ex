#
#  Created by Boyd Multerer on 6/4/18.
#  Copyright © 2017 Kry10 Industries. All rights reserved.
#

defmodule Scenic.Primitive.Style.Join do
  use Scenic.Primitive.Style

  # ============================================================================
  # data verification and serialization

  # --------------------------------------------------------
  def info(data),
    do: """
      #{IO.ANSI.red()}#{__MODULE__} data must be one of :miter, :round, :bevel
      #{IO.ANSI.yellow()}Received: #{inspect(data)}
      #{IO.ANSI.default_color()}
    """

  # --------------------------------------------------------
  # named color

  def verify(stroke) do
    case normalize(stroke) do
      :error -> false
      _ -> true
    end
  end

  # --------------------------------------------------------

  def normalize(:miter), do: :miter
  def normalize(:round), do: :round
  def normalize(:bevel), do: :bevel
  def normalize(_), do: :error
end
