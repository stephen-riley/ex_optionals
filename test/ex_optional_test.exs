defmodule ExOptionalTest do
    use ExUnit.Case
    alias ExOptional, as: O

    doctest ExOptional

    test "to and from optional" do
        res =
            "test"
            |> O.to_optional
            |> O.from_optional
        
        assert res == "test"
    end

    test "map with success optional" do
        res =
            [ "1", "2" ]
            |> O.to_optional
            |> O.Enum.map( fn x -> x <> x end )
            |> O.from_optional

        assert res == [ "11", "22" ]
    end

    test "map with failed optional" do
        res =
            nil
            |> O.Enum.map( & &1 )
        
        assert O.fail?( res )
    end

    test "handles raises" do
        res =
            [ "1", "2" ]
            |> O.to_optional
            |> O.Enum.map( fn _ -> raise "deliberate error" end )
        
        assert O.fail?( res )
    end

    test "sort" do
        res =
            [ 3, 1, 2 ]
            |> O.to_optional
            |> O.Enum.sort
        
        assert O.success?( res )

        assert O.from_optional( res ) === [ 1, 2, 3 ]
    end

    test "apply with MFA" do
        res =
            [ "1", "2" ]
            |> O.to_optional
            |> O.opt_apply( Enum, :map, fn x -> x <> x end )
            |> O.from_optional

        assert res == [ "11", "22" ]
    end

    test "apply with fn" do
        res =
            [ "1", "2" ]
            |> O.to_optional
            |> O.opt_apply( &Enum.map/2, fn x -> x <> x end )
            |> O.from_optional

        assert res == [ "11", "22" ]
    end
end
