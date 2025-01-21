{ pkgs, ...}:
{
	programs.git = {
		enable = true;
		userName = "haru-0205";
		userEmail = "rm23081b@st.omu.ac.jp";
		extraConfig = {
			init = {
				defaultBranch = "main";
			};
		};
	};
}
