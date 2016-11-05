defmodule ExOptional.Map do
    @moduledoc """
    `ExOptional.Enum` provides a (minimal) set of `Map`-related functions to work with "Optional" types.
    """

    @doc """
    Calls `Map.get/2` on the value of a success Optional and returns the value as an Optional, or returns a failed Optional.

    ## Examples

        iex> ExOptional.get( { :ok, %{ key: "value" } }, :key )
        { :ok, "value" }

        iex> ExOptional.get( { :ok, %{ key: "value" } }, :unknown )
        { :ok, nil }

        iex> ExOptional.get( { :no, %{ key: "value" } }, :unknown )
        { :no, nil }

    """
    def get( opt, key ) do
        try do
            case opt do
                { :ok, map } ->
                    { :ok, Map.get( map, key ) }
                _ ->
                    { :no, nil }
            end
        rescue
            _ -> { :no, nil }
        end
    end    
end