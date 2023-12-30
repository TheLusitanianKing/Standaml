:portugal: [Versão portuguesa/Portuguese version](README.md)
***

# Standaml [![CI](https://github.com/TheLusitanianKing/Standaml/actions/workflows/docker-image.yml/badge.svg)](https://github.com/TheLusitanianKing/Standaml/actions/workflows/docker-image.yml)
Standing of your favorite football leagues in your terminal

Source of the results: https://www.football-data.org

## Usage

```bash
# show first 5 teams in the English Premier League (code: PL)
dune exec standaml -- PL -n 5
> Rank | Team                 | P  | W | D | L | GF | GA | GD | Points
> --------------------------------------------------------------------
> 1    | Manchester City FC   | 12 | 9 | 1 | 2 | 32 | 12 | 20 | 28    
> 2    | Liverpool FC         | 12 | 8 | 3 | 1 | 27 | 10 | 17 | 27    
> 3    | Arsenal FC           | 12 | 8 | 3 | 1 | 26 | 10 | 16 | 27    
> 4    | Tottenham Hotspur FC | 12 | 8 | 2 | 2 | 24 | 15 | 9  | 26    
> 5    | Aston Villa FC       | 12 | 8 | 1 | 3 | 29 | 17 | 12 | 25

# you can check the different options
dune exec standaml -- --help
```

## Configuration

### Football-data token
First step is registering at https://www.football-data.org and get your own API token. Once registered, you should receive the token by email or get it through the site. 
Second step is putting the token in the config file (`standaml.conf`) that you should copy from the template (`standaml.default.conf`).

Example:
```bash
cp standaml.default.conf standaml.conf # copy the template config file
vim standaml.conf # open the file to fill it with your token
```

### (Optional) Colours
If you wish to associate a colour to a team:

```bash
cp colour.default.conf colour.conf # copy the template
vim colour.conf # open the file
```

In that file, you can associate a colour to a team this way: `Team A=Colour`, each line being a separate instruction.
Available colours at the moment being: `Black`, `Red`, `Green`, `Yellow`, `Blue`, `Magenta`, `Cyan` and `White`.

### Prerequisites
#### Manual installation option
You can choose to install everything locally, using the Dockerfile as a guide to install the right OCaml version and all the libraries dependencies. In `src/`, you'll find a `Makefile` that you can use with `make` instructions, or just read the file to see the existing `dune` commands and use those directly.

#### Docker option
My suggestion is using Docker. For instance:
```bash
# build the Docker image
docker build -t standaml/ocaml .

# and, being in the project's folder (otherwise, you can insert the `src` value manually), you can execute any command you wish like this below
docker run --rm -w /app --mount type=bind,src=$(pwd),dst=/app standaml/ocaml sh -c "cd src && dune exec standaml -- PPL -n 5"
```
It's a quite long command but it's the simplest option for sure.

#### VSCode dev containers option
In case, you wish to contribute or explore the actual code, you can use VSCode dev containers, it's a very nice feature and the `.devcontainer/` folder is already set up. More information about this at https://code.visualstudio.com/docs/devcontainers/containers.

### Available competitions
You can check the list of all the competitions at https://docs.football-data.org/general/v4/lookup_tables.html#_league_codes.
Just make sure they're in your tier subscription plan.
The free plan (tier one) gives access to the major competitions, to name only a few:

* :england: PL - Premier League
* :portugal: PPL - Primeira Liga
* :fr: FL1 - Ligue 1
* :de: BL1 - Bundesliga
* :es: PD - La Liga (Primera División)
* :it: SA - Serie A 
* :netherlands: DED - Eredivisie
* :brazil: BSA - Brasileirão

Side note to remind that it will only work with competitions with a league format.

## Future features and bugs
see [Issues](https://github.com/TheLusitanianKing/Standaml/issues)

## License
see [MIT License](LICENSE).
