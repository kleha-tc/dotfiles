{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "kleha";
    userEmail = "rm23081b@st.omu.ac.jp";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
