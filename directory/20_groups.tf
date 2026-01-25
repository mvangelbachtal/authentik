data "authentik_group" "admins" {
  name = "authentik Admins"
  include_users = false
}

locals {
  group_key_to_id = {
    admins = data.authentik_group.admins.id
    NextcloudAdmins = authentik_group.NextcloudAdmins.id
    Musikverein = authentik_group.Musikverein.id
    Vorstandschaft = authentik_group.Vorstandschaft.id
    Vorstand = authentik_group.Vorstand.id
    Vorsitzende = authentik_group.Vorsitzende.id
    Beirat = authentik_group.Beirat.id
    Ehrenvorsitzende = authentik_group.Ehrenvorsitzende.id
    Jugendvorstand = authentik_group.Jugendvorstand.id
    Jugendvertretung = authentik_group.Jugendvertretung.id
    Jugendbeirat = authentik_group.Jugendbeirat.id
    AußerordentlicheJugendvorstandsmitglieder = authentik_group.AußerordentlicheJugendvorstandsmitglieder.id
    PublicRelations = authentik_group.PublicRelations.id
    MusikalischeAbteilung = authentik_group.MusikalischeAbteilung.id
    Dirigat = authentik_group.Dirigat.id
    Orchestersprechende = authentik_group.Orchestersprechende.id
    Notenverwaltung = authentik_group.Notenverwaltung.id
    Administration = authentik_group.Administration.id
  }

  group_name_to_id = {
    for k, g in local.group_key_to_id : k => g
  }
}
