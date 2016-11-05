defmodule ExOptional.Mixfile do
    use Mix.Project

    def project do
        [app: :ex_optional,
         version: "0.1.0",
         elixir: "~> 1.3",
         build_embedded: Mix.env == :prod,
         start_permanent: Mix.env == :prod,
         deps: deps()]
    end

    def application do
        [applications: [:logger]]
    end

    defp deps do
        []
    end

    defp package do
        [
            "description": "Separates a paragraph into sentences in several languages.    A port of perl's Lingua::Sentence",
            files: [ "lib", "mix.exs", "README.md", "LICENSE*", "share", "test" ],
            maintainers: [ "Stephen Riley" ],
            licenses: [ "GNU LESSER GENERAL PUBLIC LICENSE v3" ],
            links: %{ "GitHub" => "https://github.com/stephen-riley/ex_lingua_sentence" }
        ]
    end
    
end
