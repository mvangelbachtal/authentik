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
  parent = authentik_group.Musikverein.id
}

resource "authentik_group" "Vorstand" {
  name         = "Vorstand"
  parent = authentik_group.Vorstandschaft.id
}

resource "authentik_group" "Vorsitzende" {
  name         = "Vorsitzende"
  parent = authentik_group.Vorstand.id
}

resource "authentik_group" "Beirat" {
  name         = "Beirat"
  parent = authentik_group.Vorstandschaft.id
}

resource "authentik_group" "Ehrenvorsitzende" {
  name         = "Ehrenvorsitzende"
  parent = authentik_group.Vorstandschaft.id
}

resource "authentik_group" "Jugendvorstand" {
  name         = "Jugendvorstand"
  parent = authentik_group.Musikverein.id
}

resource "authentik_group" "Jugendvertretung" {
  name         = "Jugendvertretung"
  parent = authentik_group.Jugendvorstand.id
}

resource "authentik_group" "Jugendbeirat" {
  name         = "Jugendbeirat"
  parent = authentik_group.Jugendvorstand.id
}

resource "authentik_group" "AußerordentlicheJugendvorstandsmitglieder" {
  name         = "Außerordentliche Jugendvorstandsmitglieder"
  parent = authentik_group.Jugendvorstand.id
}

resource "authentik_group" "PublicRelations" {
  name         = "Public Relations"
  parent = authentik_group.Musikverein.id
}

resource "authentik_group" "Notenverwaltung" {
  name         = "Notenverwaltung"
  parent = authentik_group.Musikverein.id
}

resource "authentik_group" "Administration" {
  name         = "Administration"
  parent = authentik_group.Musikverein.id
}

resource "authentik_group" "MusikalischeAbteilung" {
  name         = "Musikalische Abteilung"
  parent = authentik_group.Musikverein.id
}

resource "authentik_group" "Dirigat" {
  name         = "Dirigat"
  parent = authentik_group.MusikalischeAbteilung.id
}

resource "authentik_group" "Orchestersprechende" {
  name         = "Orchestersprechende"
  parent = authentik_group.MusikalischeAbteilung.id
}
