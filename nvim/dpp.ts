import {
	ContextBuilder,
	BaseConfig,
	Dpp,
	Plugin,
} from "https://deno.land/x/dpp_vim@v0.3.0/types.ts";
import { Denops, fn} from "https://deno.land/x/dpp_vim@v0.3.0/deps.ts";
export class Config extends BaseConfig {
	override async config(args: {
		denops: Denops;
		contextBuilder: ContextBuilder;
		basePath: string;
		dpp: Dpp;
	}): Promise<ConfigReturn> {
		args.contextBuilder.setGlobal({
			protocols: ["git"],
		});

		type Toml = {
			hooks_file?: string;
			ftplugins?: Record<string, string>;
			plugins?: Plugin[];
		};

		type LazyMakeStateResult = {
			plugins: Plugin[];
			stateLines: string[];
		};

		const [context, options] = await args.contextBuilder.get(args.denops);
		const recordPlugins: Record<string, Plugin> = {};
		const ftplugins: Record<string, string> = {};
		const hooksFiles: string[] = [];
		const tomls: Toml[] = [];
		let multipleHooks: MultipleHook[] = [];

		// Load toml

		tomls.push(
			await args.dpp.extAction(
				args.denops,
				context,
				options,
				"toml",
				"load",
				{
					path: await fn.expand(args.denops, "~/.config/nvim/dpp.toml"),
					options: {
						lazy: false,
					},
				},
			) as Toml,
		);
		
		tomls.push(
			await args.dpp.extAction(
				args.denops,
				context,
				options,
				"toml",
				"load",
				{
					path: await fn.expand(args.denops, "~/.config/nvim/dpp_lazy.toml"),
					options: {
						lazy: true,
					},
				},
			) as Toml,
		);

			// merge toml results
		//
		tomls.forEach((toml) => {
			for (const plugin of toml.plugins) {
				recordPlugins[plugin.name] = plugin;
			}

			if (toml.ftplugins) {
				for (const filetype of Object.keys(toml.ftplugins)) {
					if (ftplugins[filetype]) {
						ftplugins[filetype] += `\n${toml.ftplugin[filetype]}`;
					} else {
						ftplugins[filetype] += toml.ftplugins[filetype];
					}
				}
			}

			if (toml.hooks_file) {
				hooksFiles.push(toml.hooks_file);
			}
		});

		const lazyResult = await args.dpp.extAction(
      args.denops,
      context,
      options,
      "lazy",
      "makeState",
      {
        plugins: Object.values(recordPlugins),
      },
    ) as LazyMakeStateResult;

    console.log(lazyResult);


		return {
			ftplugins,
			hooksFiles,
			plugins: lazyResult?.plugins ?? [],
			stateLines: lazyResult?.stateLines ?? [],
		};
	}
}

