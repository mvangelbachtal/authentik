## Gruppen
| Gruppe / Abteilung                         | Rollen / Mitglieder                                                                                  |
|-------------------------------------------|-----------------------------------------------------------------------------------------------------|
| 👥 **Musikverein**                          |                                                                                                     |
| ➡️ 👥 **Vorstandschaft**                   | Vorstand, Beirat, Ehrenvorsitzende (optional)                                                       |
| ➡️ ➡️ 👥 **Vorstand**                       | Vorsitzende, 👤 Kassier\*in, 👤 Geschäftsführer\*in                                                  |
| ➡️ ➡️ ➡️ 👥 **Vorsitzende**                 | 👤 1. Vorsitzende, 👤 2. Vorsitzende                                                               |
| ➡️ ➡️ 👥 **Beirat**                         | 👤 Beirät\*in, 👤 Beirät\*in (optional) x7                                                          |
| ➡️ 👥 **Jugendvorstand**                    | Jugendvertretung, Jugendbeirat, Außerordentliche Jugendvorstandsmitglieder (optional)              |
| ➡️ ➡️ 👥 **Jugendvertretung**               | 👤 Jugendleiter\*in x3                                                                              |
| ➡️ ➡️ 👥 **Jugendbeirat**                   | 👤 Jugendbeirät\*in, 👤 Jugendbeirät\*in (optional) x2                                              |
| ➡️ ➡️ 👥 **Außerordentliche Jugendvorstandsmitglieder** | 👤 Elternvertreter\*in, 👤 Weitere Mitglieder (optional)                               |
| ➡️ 👥 **Public Relations**                  | 👤 PR-Mitglied, 👤 Geschäftsführer\*in, 👤 Weitere PR-Mitglieder (optional), Vorsitzende, Administration |
| ➡️ 👥 **Notenverwaltung**                   | 👤 Notenwärt\*in, 👤 Weitere Notenwärt\*innen (optional)                                            |
| ➡️ 👥 **Musikalische Abteilung**            | 👤 Geschäftsführer\*in, Dirigat, Orchestersprechende, Vorsitzende                                   |
| ➡️ ➡️ 👥 **Dirigat**                        | 👤 Dirigent\*in, 👤 Stellv. Dirigent\*in (optional), 👤 Jugenddirigent\*in                            |
| ➡️ ➡️ 👥 **Orchestersprechende**           | 👤 Orchestersprecher\*in                                                                           |
| ➡️ 👥 **Administration**                    | 👤 Admin, 👤 Weitere Admins (optional), Vorstand                                                    |

Gruppen für Nextcloud und andere Dienste (welche im [IdP](https://en.wikipedia.org/wiki/Identity_provider) authentik angelegt werden).

<details>
<summary>Gruppen-Graph</summary>

```mermaid
flowchart LR
    %% Root
    Musikverein["👥 Musikverein"]

    %% Groups
    Vorstandschaft["👥 Vorstandschaft"]
    Jugendvorstand["👥 Jugendvorstand"]
    PublicRelations["👥 Public Relations"]
    Notenverwaltung["👥 Notenverwaltung"]
    Dirigat["👥 Dirigat"]
    Orchestersprechende["👥 Orchestersprechende"]
    MusikalischeAbteilung["👥 Musikalische Abteilung"]
    Administration["👥 Administration"]

    Vorstand["👥 Vorstand"]
    Vorsitzende["👥 Vorsitzende"]
    Beirat["👥 Beirat"]
    Ehrenvorsitzende["👥 Ehrenvorsitzende (optional)"]

    Jugendvertretung["👥 Jugendvertretung"]
    Jugendbeirat["👥 Jugendbeirat"]
    Aujv["👥 Außerordentliche Jugendvorstandsmitglieder (optional)"]

    %% Vorsitzende roles
    subgraph SV [" "]
        direction LR
        Vorsitz1["👤 1. Vorsitzende"]
        Vorsitz2["👤 2. Vorsitzende"]
    end

    %% Vorstand roles
    subgraph V [" "]
        direction LR
        Kassier["👤 Kassier*in"]
        Geschaeftsfuehrer["👤 Geschäftsführer*in"]
    end

    %% Beirat roles (1 required, 7 optional)
    subgraph B [" "]
        direction LR
        Beirat1["👤 Beirät*in"]
        Beirat2["👤 Beirät*in (optional)"]
        Beirat3["👤 Beirät*in (optional)"]
        Beirat4["👤 Beirät*in (optional)"]
        Beirat5["👤 Beirät*in (optional)"]
        Beirat6["👤 Beirät*in (optional)"]
        Beirat7["👤 Beirät*in (optional)"]
        Beirat8["👤 Beirät*in (optional)"]
    end

    %% Jugendvertretung roles (exactly three)
    subgraph JV [" "]
        direction LR
        Jugendleiter1["👤 Jugendleiter*in"]
        Jugendleiter2["👤 Jugendleiter*in"]
        Jugendleiter3["👤 Jugendleiter*in"]
    end

    %% Jugendbeirat roles (1 required, 2 optional)
    subgraph JB [" "]
        direction LR
        Jugendbeirat1["👤 Jugendbeirät*in"]
        Jugendbeirat2["👤 Jugendbeirät*in (optional)"]
        Jugendbeirat3["👤 Jugendbeirät*in (optional)"]
    end

    %% Außerordentliche Jugendvorstandsmitglieder (open-ended)
    subgraph AJ [" "]
        direction LR
        Elternvertreter["👤 Elternvertreter*in"]
        WeitereAJV["👤 Weitere Mitglieder (optional)"]
    end

    subgraph D [" "]
        direction LR
        Dirigent["👤 Dirigent*in"]
        StellvDirigent["👤 Stellv. Dirigent*in (optional)"]
        Jugenddirigent["👤 Jugenddirigent*in"]
    end

    subgraph OS [" "]
        direction LR
        Orchestersprecher["👤 Orchestersprecher*in"]
    end

    subgraph PR [" "]
        direction LR
        PRMitglied["👤 PR-Mitglied"]
        WeiterePRM["👤 Weitere PR-Mitglieder (optional)"]
    end

    subgraph A [" "]
        direction LR
        Admin["👤 Admin"]
        Admin2["👤 Weitere Admins (optional)"]
    end

    subgraph N [" "]
        direction LR
        Notenwart["👤 Notenwärt*in"]
        Notenwart2["👤 Weitere Notenwärt*innen (optional)"]
    end


    %% Hierarchy (parent -> child)
    Musikverein --> Vorstandschaft
    Musikverein --> Jugendvorstand
    Musikverein --> PublicRelations
    Musikverein --> Notenverwaltung
    Musikverein --> MusikalischeAbteilung
    Musikverein --> Administration

    Vorstandschaft --> Vorstand
    Vorstandschaft --> Beirat
    Vorstandschaft -.-> Ehrenvorsitzende

    Vorstand --> Vorsitzende
    Vorstand --> V
    Vorsitzende --> SV
    Beirat --> B
    PublicRelations --> PR
    Administration --> A
    Notenverwaltung --> N

    Jugendvorstand --> Jugendvertretung
    Jugendvorstand --> Jugendbeirat
    Jugendvorstand -.-> Aujv

    Jugendvertretung --> JV
    Jugendbeirat --> JB
    Aujv --> AJ

    Dirigat --> D
    Orchestersprechende --> OS

    MusikalischeAbteilung --> Dirigat
    MusikalischeAbteilung --> Orchestersprechende

    %% Cross-affiliation
    Vorstandschaft -.-> Jugendvertretung
    MusikalischeAbteilung -.-> Vorsitzende
    MusikalischeAbteilung -.-> Geschaeftsfuehrer
    PublicRelations -.-> Vorsitzende
    PublicRelations -.-> Administration
    PublicRelations -.-> Geschaeftsfuehrer
    Administration -.-> Vorstand
```

</details>

## Nextcloud Team Folders
<details>
<summary>Ordner-Graph</summary>

```mermaid
flowchart LR
    NC["📁 Nextcloud"]

    Jugendarbeit["📁 Jugendarbeit"]
    Medien["📁 Medien"]
    Noten["📁 Noten"]
    Upload["📁 Upload"]
    Veranstaltungen["📁 Veranstaltungen"]
    VorstandschaftFolder["📁 Vorstandschaft"]
    MusikalischeAbteilung["📁 Musikalische Abteilung"]

    NC --> Jugendarbeit
    NC --> Medien
    NC --> Noten
    NC --> Upload
    NC --> Veranstaltungen
    NC --> VorstandschaftFolder
    NC --> MusikalischeAbteilung
```

</details>

### Jugendarbeit

| Group          | Read | Write | Share | Delete |
|----------------|------|-------|-------|--------|
| Jugendvorstand | 👀   | ✏️    | 🔗    | 🗑️     |
| Vorstand       | 👀   | ✏️    | 🔗    | 🗑️     |

### Medien

| Group            | Read | Write | Share | Delete |
|------------------|------|-------|-------|--------|
| Public Relations | 👀   | ✏️    | 🔗    | 🗑️     |
| Vorstandschaft   | 👀   | ✏️    | 🔗    | 🗑️     |
| Jugendvorstand   | 👀   | ✏️    | 🔗    | 🗑️     |

### Noten

| Group                  | Read | Write | Share | Delete |
|------------------------|------|-------|-------|--------|
| Notenverwaltung        | 👀   | ✏️    | 🔗    | 🗑️     |
| Musikalische Abteilung | 👀   | ✏️    | 🔗    | 🗑️     |

### Upload

| Group            | Read | Write | Share | Delete |
|------------------|------|-------|-------|--------|
| Vorstand         | 👀   | ❌    | ❌    | 🗑️     |
| Jugendvertretung | 👀   | ❌    | ❌    | 🗑️     |
| Administration   | 👀   | ❌    | ❌    | 🗑️     |

### Veranstaltungen

| Group          | Read | Write | Share | Delete |
|----------------|------|-------|-------|--------|
| Vorstandschaft | 👀   | ✏️    | 🔗    | 🗑️     |

### Vorstandschaft

| Group          | Read | Write | Share | Delete |
|----------------|------|-------|-------|--------|
| Vorstandschaft | 👀   | ✏️    | 🔗    | 🗑️     |

### Musikalische Abteilung

| Group                  | Read | Write | Share | Delete |
|------------------------|------|-------|-------|--------|
| Musikalische Abteilung | 👀   | ✏️    | 🔗    | 🗑️     |


## Usage / Developer

### Prerequisites
- OpenTofu (the `tofu` CLI) or Terraform-compatible client installed and on `PATH`.
- `direnv` installed and enabled in your shell.
- An Authentik account with an API token that has permission to manage users/groups and other resources used by this repo.

### User YAML (`env/users/mva.yaml`)

The users are defined in `env/users/mva.yaml` as a YAML list. This file is intentionally not committed to
avoid leaking real email addresses and personal data (and to prevent accidental spam). Keep a local copy
at `env/users/mva.yaml` or store it in a private location and load it via your `.envrc` if needed.

Example entry (minimal):

```yaml
- name: "Vor Name"
    # optional, generated from `name` if missing
    username: "v.name"
    # optional, defaults to <username>@mv-angelbachtal.de
    email: "v.name@mv-angelbachtal.de"
    # group identifiers refer to `authentik_group` resource names (keys)
    groups:
        - Vorstand
        - Musikverein
    attributes:
        role: "Probenclown"
```

Guidelines:
- Use the `name` field (first + last name) — `username` and `email` will be derived if omitted.
- `groups` should reference the group keys used by the Terraform `authentik_group` resources.
- Do not commit `env/users/mva.yaml` with real personal data.

### Local setup
- Create a small file containing the token at `~/.config/authentik/mva.env`, for example:

```bash
export AUTHENTIK_TOKEN="<your-authentik-api-token>"
```

- Create a `mva.yaml` file at `env/users` containing the users.
- The repository contains a `.envrc` that sources `~/.config/authentik/mva.env`. Allow direnv:

```bash
direnv allow
```

### Typical workflow
- Initialize and validate the plan:

```bash
cd /home/jan/tofu/authentik-mva
tofu init
tofu plan
```

- Apply changes:

```bash
tofu apply
```

Notes
- User data lives in `env/users/mva.yaml`.
- GUI-managed nested attributes (e.g. `contact`, `settings`) are intentionally ignored by the Terraform resources in this repo to avoid overwriting user-entered values.
