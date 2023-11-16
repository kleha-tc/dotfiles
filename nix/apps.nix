{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
	ms-python.nix
	michaelcurrin.auto-commit-msg
	ms-vscode-remote.remote-containers
	shira.pastel-sky-theme
      ];
    })
  ];
}
