# homebrew-ondevice

macOS homebrew tap for the [ondevice][ondevice] commandline client.

You can install this using:

```sh
brew install ondevice/ondevice/ondevice
```

After that, use `ondevice login` to authenticate.

## Running as device:

To autostart `ondevice daemon`, use:

```sh
brew services start ondevice
```

Make sure you [enable your mac's SSH server](https://superuser.com/a/104933).

Have a look at the main [ondevice][ondevice] repo for more detailed information.


[ondevice]: https://github.com/ondevice/ondevice
