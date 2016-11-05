defmodule ExOptional do
    def to_optional( v ) do
        case v do
            { :ok, _ } -> v
            { :no, _ } -> v
            _ -> { :ok, v }
        end
    end

    def from_optional( o ) do
        case o do
            { :ok, v } -> v
            { :no, _ } -> nil
            _ -> o
        end
    end

    def map_get( map_opt, key ) do
        case map_opt do
            { :ok, map } ->
                { :ok, Map.get( map, key ) }
            _ ->
                { :no, nil }
        end
    end

    def enum_map( enum_opt, func ) do
        case enum_opt do
            { :ok, enum } ->
                { :ok, Enum.map( enum, func ) }
            _ ->
                { :no, nil }
        end
    end

    def enum_sort( enum_opt, func ) do
        case enum_opt do
            { :ok, enum } ->
                { :ok, Enum.sort( enum, func ) }
            _ ->
                { :no, nil }
        end
    end

    def enum_flat_map( enum_opt, func ) do
        case enum_opt do
            { :ok, enum } ->
                { :ok, Enum.flat_map( enum, func ) }
            _ ->
                { :no, nil }
        end
    end
end
