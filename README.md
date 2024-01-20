# flycheck-haml-lint

[flycheck](https://www.flycheck.org/en/latest/index.html) checker for [haml-lint](https://github.com/sds/haml-lint).

The `haml-lint` configuration was extracted from [this emacs configuration](https://github.com/jdelStrother/dotfiles).

## Usage

Ensure that `haml-lint` is installed in your project.

Then, configure `flycheck` in your configuration:

```elisp
(with-eval-after-load 'flycheck
  (flycheck-haml-lint-setup))
```

## License

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see http://www.gnu.org/licenses/.

See [`LICENSE`](LICENSE) for details.
