
### Deploy skript fra Ole Tommy
function adep() {
    # Henter miljøargument
    local env_var=$1

    # Henter argument for inkluderingsvalg av branch ("b" for branch, "v" for verdi fra argument 3)
    local include_branch=$2

    # Henter verdi som skal brukes dersom "v" er valgt
    local value_argument=$3

    # Validerer at miljøargumentet er satt
    if [[ -z "$env_var" ]]; then
        echo "Feil: Miljøargumentet må spesifiseres."
        return 1
    fi

    # Hent prosjektmappe fra git eller nåværende katalog
    if [[ -d .git ]]; then
        local project_name=$(basename $(git rev-parse --show-toplevel))
    else
        echo "Advarsel: Ingen .git-mappe funnet. Bruker nåværende katalog som prosjektnavn."
        local project_name=$(basename $(pwd))
    fi

    # Hent branchnavn fra git, hvis tilgjengelig
    if [[ -d .git ]]; then
        local branch_name=$(git rev-parse --abbrev-ref HEAD)
    else
        echo "Advarsel: Ingen git-repo funnet. Ingen branchnavn tilgjengelig."
        local branch_name=""
    fi

    # Erstatt bindestrek med understrek i branchnavn
    if [[ -n "$branch_name" ]]; then
        branch_name=${branch_name//-/_}
    fi

    # Formatér branchnavn for SNAPSHOT-versjoner
    if [[ "$branch_name" == feature/* ]]; then
        branch_name=${branch_name/feature\//feature_}"-SNAPSHOT"
    fi

    # Bygg kommandoen basert på argumenter
    local command="ao deploy $env_var $project_name"

    # Legg til branch-versjon eller verdi fra argument 3 hvis valgt
    if [[ "$include_branch" == "b" && -n "$branch_name" ]]; then
        command="$command -v$branch_name"
    elif [[ "$include_branch" == "v" && -n "$value_argument" ]]; then
        command="$command -v$value_argument"
    fi

    # Utfør kommandoen
    eval $command
}
## ------------------------------------------------------------------------------
