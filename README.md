# asdf-promtool

[promtool](https://github.com/prometheus/prometheus) plugin for the [asdf version manager](https://asdf-vm.com).

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.

# Install

Plugin:

```shell
asdf plugin add promtool
# or
asdf plugin add promtool https://gitlab.com/gitlab-com/gl-infra/asdf-promtool.git
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

# License

Copyright (c) 2011-present GitLab B.V.

Portions of this software are licensed as follows:

* All content residing under the "doc/" directory of this repository is licensed under "Creative Commons: CC BY-SA 4.0 license".
* All content that resides under the "ee/" directory of this repository, if that directory exists, is licensed under the license defined in "ee/LICENSE".
* All content that resides under the "jh/" directory of this repository, if that directory exists, is licensed under the license defined in "jh/LICENSE".
* All client-side JavaScript (when served directly or after being compiled, arranged, augmented, or combined), is licensed under the "MIT Expat" license.
* All third party components incorporated into the GitLab Software are licensed under the original license provided by the owner of the applicable component.
* Content outside of the above mentioned directories or restrictions above is available under the "MIT Expat" license as defined below.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
