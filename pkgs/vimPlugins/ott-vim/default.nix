{
  lib,
  source,
  buildVimPlugin,
}:
buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    homepage = "https://github.com/tsung-ju/ott-vim";
    description = "Vim syntax highlighting for the Ott programming language design tool.";
    license = licenses.mit;
  };
}
