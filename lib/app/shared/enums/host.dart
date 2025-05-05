enum Host {
  api,
  devices,
  devicesHml,
  eventSearch,
  eventSearchHml,
  event,
  cep,
  undefined,
}

extension HostExtension on Host {
  get url {
    switch (this) {
      case Host.api:
        return 'api.ingresse.com';
      case Host.eventSearch:
        return 'event-search.ingresse.com';
      case Host.eventSearchHml:
        return 'event.ingresse.com/search/company/';
      case Host.event:
        return 'event.ingresse.com';
      case Host.devices:
        return 'api-devices.ingresse.com';
      case Host.cep:
        return 'cep.ingresse.com';
      case Host.devicesHml:
        return 'api-devices-hml.ingresse.com';
      case Host.undefined:
        return '';
    }
  }
}
