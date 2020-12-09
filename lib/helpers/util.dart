enum Environment{
  LOCAL,
  LIVE
}

const _v = String.fromEnvironment("VERSION");
const Environment environment = _v == 'live' ? Environment.LIVE : Environment.LOCAL;

