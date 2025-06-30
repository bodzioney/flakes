{
  lib,
  source,
  buildVimPlugin,
}:
buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    homepage = "https://github.com/erooke/blink-cmp-latex";
    description = "A latex source for blink.cmp";
    license = licenses.bsd3;
  };
}
