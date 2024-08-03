# Dev Container Dotfiles

dotfiles repository for Dev Containers, managed with [chezmoi](https://chezmoi.io/).

This repository is used by our [Codespaces](https://github.com/features/codespaces) and [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
for Microsoft 365, which can be found here:

*Codespaces:*
- [Codespace for 🧑‍💼 Microsoft 365 Admins](https://github.com/workoho/codespace-m365-admin)
- [Codespace for 🧑‍💻 Microsoft 365 Developers and 🧑‍💼 Sophisticated Admins](https://github.com/workoho/codespace-m365-dev)
- [Codespace for 🧑‍🔧 Holistic Microsoft 365 & Azure Professionals](https://github.com/workoho/codespace-m365-ultimate)

*Dev Containers:*
- [🧑‍💼 Admin Container for Microsoft 365](https://github.com/workoho/devcontainer-templates/tree/main/src/m365-admin)
- [🧑‍💻 Development Container for Microsoft 365](https://github.com/workoho/devcontainer-templates/tree/main/src/m365-dev)
- [🧑‍🔧 Ultimate Container for Microsoft 365](https://github.com/workoho/devcontainer-templates/tree/main/src/m365-ultimate)

## Use Your Own Dotfiles

You may clone this repository to make adjustments for your own experience.
If you do so, change the `dotfiles.repository` in your VS Code settings. Look for them in the
`.devcontainer/devcontainer.json` file in the section `customizations.vscode.settings`.

## Daily Operations

To handle your own dotfiles with Chezmoi, we recommend to read the [Daily Operations user guide](https://www.chezmoi.io/user-guide/daily-operations/).

## License

Copyright © Workoho GmbH. All rights reserved.

Licensed under the MIT License. See [LICENSE.txt](https://github.com/workoho/devcontainer-image-m365-ultimate/blob/main/LICENSE.txt)
