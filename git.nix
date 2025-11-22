{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
			user = {
				email = "kleha@klefpj.org";
				name = "kleha";
			};
    };
  };
}
