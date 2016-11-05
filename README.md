# ExOptional

`ExOptional` provides a (minimal) set of functions to work with "Optional" types.

In Elixir, Optional types are really just two-element tuples.  Success Optionals look like

`{ :ok, value }`

while failed Optionals have some other value for the first element.  (`ExOptional` uses `:no` by default, but largely doesn't care.)

Currently, failed Optionals will only have a value of `nil`.  In the future, `ExOptional` may support failed values as well.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `ex_optional` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ex_optional, "~> 0.1.0"}]
    end
    ```

  2. Ensure `ex_optional` is started before your application:

    ```elixir
    def application do
      [applications: [:ex_optional]]
    end
    ```

