defmodule ExOptional do
    @moduledoc """
    `ExOptional` provides a (minimal) set of functions to work with "Optional" types.

    In Elixir, Optional types are really just two-element tuples.  Success Optionals look like

    `{ :ok, value }`

    while failed Optionals have some other value for the first element.  (`ExOptional` uses `:no` by default, but largely doesn't care.)

    Currently, failed Optionals will only have a value of `nil`.  In the future, `ExOptional` may support failed values as well.
    """

    @doc """
    Test if an Optional is successful.

    Returns `true` or `false`.

    ## Examples

        iex> ExOptional.success?( { :ok, 123 } )
        true

    """
    def success?( opt ) do
        case opt do
            { :ok, _ } -> true
            _ -> false
        end
    end

    @doc """
    Test if an Optional is failed.

    Returns `true` or `false`.

    ## Examples

        iex> ExOptional.fail?( { :ok, 123 } )
        false

    """
    def fail?( opt ) do
        case opt do
            { :no, _ } -> true
            _ -> false
        end
    end

    @doc """
    Wrap a value as a success Optional.

    Returns `{ :ok, value }`.

    ## Examples

        iex> ExOptional.to_optional( 123 )
        { :ok, 123 }

    """
    def to_optional( value ) do
        case value do
            { :ok, _ } -> value
            { :no, _ } -> value
            _ -> { :ok, value }
        end
    end

    @doc """
    Unwrap a value from a success Optional.

    ## Examples

        iex> ExOptional.from_optional( { :ok, 123 } )
        123

        iex> ExOptional.from_optional( { :no, 123 } )
        nil

    """
    def from_optional( opt ) do
        case opt do
            { :ok, val } -> val
            { :no, _ } -> nil
            _ -> opt
        end
    end
end
