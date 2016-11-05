defmodule ExOptional.Enum do
    @moduledoc """
    `ExOptional.Enum` provides a (minimal) set of `Enum`-related functions to work with "Optional" types.
    """
    
    @doc """
    Calls `Enum.map/2` on the value of a success Optional and returns the mapped `Enum` as an Optional, or returns a failed Optional.

    ## Examples

        iex> ExOptional.map( { :ok, [ 1, 2, 3 ] }, & &1 )
        { :ok, [ 1, 2, 3 ] }

        iex> ExOptional.map( { :no, [ 1, 2, 3 ] }, & &1 )
        { :no, nil }

    """
    def map( opt, func ) do
        try do
            case opt do
                { :ok, enum } ->
                    { :ok, Enum.map( enum, func ) }
                _ ->
                    { :no, nil }
            end
        rescue
            _ -> { :no, nil }
        end
    end

    @doc """
    Calls `Enum.sort/2` on the value of a success Optional and returns the mapped `Enum` as an Optional, or returns a failed Optional.

    ## Examples

        iex> ExOptional.sort( { :ok, [3, 1, 2] }, & &1 > &2 )
        { :ok, [ 3, 2, 1 ] }

        iex> ExOptional.sort( { :no, [ 3, 1, 2 ] } )
        { :no, nil }

    """
    def sort( opt, func \\ fn( a, b ) -> a < b end ) do
        try do
            case opt do
                { :ok, enum } ->
                    { :ok, Enum.sort( enum, func ) }
                _ ->
                    { :no, nil }
            end
        rescue
            _ -> { :no, nil }
        end
    end

    @doc """
    Calls `Enum.flat_map/2` on the value of a success Optional and returns the mapped `Enum` as an Optional, or returns a failed Optional.

    """
    def flat_map( opt, func ) do
        try do
            case opt do
                { :ok, enum } ->
                    { :ok, Enum.flat_map( enum, func ) }
                _ ->
                    { :no, nil }
            end
        rescue
            _ -> { :no, nil }
        end
    end    
end