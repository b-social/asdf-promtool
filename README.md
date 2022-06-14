# asdf-promtool

[promtool](https://github.com/prometheus/prometheus), [amtool](https://github.com/prometheus/alertmanager) and [thanos](https://github.com/thanos-io/thanos) plugin for the [asdf version manager](https://asdf-vm.com).

## Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

## Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.

## Install

Plugin:

```shell
asdf plugin add promtool https://gitlab.com/gitlab-com/gl-infra/asdf-promtool.git
asdf plugin add amtool https://gitlab.com/gitlab-com/gl-infra/asdf-promtool.git
asdf plugin add thanos https://gitlab.com/gitlab-com/gl-infra/asdf-promtool.git
```

## Using the plugin:

```shell
# Show all installable versions
asdf list-all promtool
asdf list-all amtool
asdf list-all thanos

# Install specific version
asdf install promtool latest
asdf install amtool latest
asdf install thanos latest

# Set a version globally (on your ~/.tool-versions file)
asdf global promtool latest
asdf global amtool latest
asdf global thanos latest

# Now promtool commands are available
promtool --version
amtool --version
thanos --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

# License

Copyright (c) 2011-2022 GitLab B.V.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
