String countryCodeFromCountryName(String countryName) {
  switch (countryName.toLowerCase()) {
    case 'united states':
      return 'us';
    case 'united kingdom':
      return 'gb';
    case 'australia':
      return 'au';
    case 'canada':
      return 'ca';
    case 'india':
      return 'in';
    case 'germany':
      return 'de';
    case 'france':
      return 'fr';
    case 'italy':
      return 'it';
    case 'netherlands':
      return 'nl';
    case 'spain':
      return 'es';
    case 'brazil':
      return 'br';
    case 'argentina':
      return 'ar';
    case 'russia':
      return 'ru';
    case 'china':
      return 'cn';
    default:
      return '';
  }
}
