defmodule ExOptional.Mixfile do
    use Mix.Project

    def project do
        [app: :ex_optional,
         version: "0.1.2",
         elixir: "~> 1.3",
         build_embedded: Mix.env == :prod,
         start_permanent: Mix.env == :prod,
         deps: deps(),
         package: package()]
    end

    def application do
        [applications: [:logger]]
    end

    defp deps do
        [
            {:ex_doc, ">= 0.0.0", only: :dev}
        ]
    end

    defp package do
        [
            "description": "A set of functions to easily use \"Optional\" types in Elixir",
            files: [ "lib", "mix.exs", "README.md", "LICENSE*", "test" ],
            maintainers: [ "Stephen Riley" ],
            licenses: [ "GNU LESSER GENERAL PUBLIC LICENSE v3" ],
            links: %{ "GitHub" => "https://github.com/stephen-riley/ex_lingua_sentence" }
        ]
    end
end
