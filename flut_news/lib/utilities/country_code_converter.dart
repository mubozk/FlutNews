String countryCodeFromCountryName(String countryName) {
  Map<String, String> countryCodes = {
    'united states': 'us',
    'united kingdom': 'gb',
    'australia': 'au',
    'canada': 'ca',
    'india': 'in',
    'germany': 'de',
    'france': 'fr',
    'italy': 'it',
    'netherlands': 'nl',
    'spain': 'es',
    'brazil': 'br',
    'argentina': 'ar',
    'russia': 'ru',
    'china': 'cn',
    'turkey': 'tr',
    'japan': 'jp',
    'switzerland': 'ch',
    'uae': 'ae',
    'austria': 'at',
    'belgium': 'be',
    'bulgaria': 'bg',
    'colombia': 'co',
    'cuba': 'cu',
    'czech republic': 'cz',
    'egypt': 'eg',
    'greece': 'gr',
    'hong kong': 'hk',
    'hungary': 'hu',
    'indonesia': 'id',
    'ireland': 'ie',
    'israel': 'il',
    'latvia': 'lv',
    'lithuania': 'lt',
    'malaysia': 'my',
    'mexico': 'mx',
    'morocco': 'ma',
    'new zealand': 'nz',
    'nigeria': 'ng',
    'norway': 'no',
    'philippines': 'ph',
    'poland': 'pl',
    'portugal': 'pt',
    'romania': 'ro',
    'serbia': 'rs',
    'singapore': 'sg',
    'slovakia': 'sk',
    'slovenia': 'si',
    'south africa': 'za',
    'south korea': 'kr',
    'sweden': 'se',
    'taiwan': 'tw',
    'thailand': 'th',
    'ukraine': 'ua',
    'venezuela': 've',
    'türkiye': 'tr'
  };
  return countryCodes[countryName] ?? '';
}
