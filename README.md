<div align="center">

# asdf-promtool [![Build](https://github.com/suprememoocow/asdf-promtool/actions/workflows/build.yml/badge.svg)](https://github.com/suprememoocow/asdf-promtool/actions/workflows/build.yml) [![Lint](https://github.com/suprememoocow/asdf-promtool/actions/workflows/lint.yml/badge.svg)](https://github.com/suprememoocow/asdf-promtool/actions/workflows/lint.yml)


[promtool](https://github.com/prometheus/prometheus) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add promtool
# or
asdf plugin add promtool https://github.com/suprememoocow/asdf-promtool.git
```

promtool:

```shell
# Show all installable versions
asdf list-all promtool

# Install specific version
asdf install promtool latest

# Set a version globally (on your ~/.tool-versions file)
asdf global promtool latest

# Now promtool commands are available
promtool --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/suprememoocow/asdf-promtool/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Andrew Newdigate](https://github.com/suprememoocow/)
