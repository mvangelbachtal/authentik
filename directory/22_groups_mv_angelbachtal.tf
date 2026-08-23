resource "authentik_group" "Musikverein" {
  name         = "Musikverein"
  attributes = jsonencode(
    {
      nextcloud_quota = "3 GB"
      organisation = "Musikverein Angelbachtal e.V."
    }
  )
}

resource "authentik_group" "Vorstandschaft" {
  name         = "Vorstandschaft"
  parents = [authentik_group.Musikverein.id]
}

resource "authentik_group" "Vorstand" {
  name         = "Vorstand"
  parents = [authentik_group.Vorstandschaft.id]
}

resource "authentik_group" "Vorsitzende" {
  name         = "Vorsitzende"
  parents = [authentik_group.Vorstand.id]
}

resource "authentik_group" "Beirat" {
  name         = "Beirat"
  parents = [authentik_group.Vorstandschaft.id]
}

resource "authentik_group" "Ehrenvorsitzende" {
  name         = "Ehrenvorsitzende"
  parents = [authentik_group.Vorstandschaft.id]
}

resource "authentik_group" "Jugendvorstand" {
  name         = "Jugendvorstand"
  parents = [authentik_group.Musikverein.id]
}

resource "authentik_group" "Jugendvertretung" {
  name         = "Jugendvertretung"
  parents = [authentik_group.Jugendvorstand.id]
}

resource "authentik_group" "Jugendbeirat" {
  name         = "Jugendbeirat"
  parents = [authentik_group.Jugendvorstand.id]
}

resource "authentik_group" "AußerordentlicheJugendvorstandsmitglieder" {
  name         = "Außerordentliche Jugendvorstandsmitglieder"
  parents = [authentik_group.Jugendvorstand.id]
}

resource "authentik_group" "PublicRelations" {
  name         = "Public Relations"
  parents = [authentik_group.Musikverein.id]
}

resource "authentik_group" "Notenverwaltung" {
  name         = "Notenverwaltung"
  parents = [authentik_group.Musikverein.id]
}

resource "authentik_group" "Administration" {
  name         = "Administration"
  parents = [authentik_group.Musikverein.id]
}

resource "authentik_group" "MusikalischeAbteilung" {
  name         = "Musikalische Abteilung"
  parents = [authentik_group.Musikverein.id]
}

resource "authentik_group" "Dirigat" {
  name         = "Dirigat"
  parents = [authentik_group.MusikalischeAbteilung.id]
}

resource "authentik_group" "Schlagwerk" {
  name         = "Schlagwerk"
  parents = [authentik_group.Musikverein.id]
}

resource "authentik_group" "Orchestersprechende" {
  name         = "Orchestersprechende"
  parents = [authentik_group.MusikalischeAbteilung.id]
}
