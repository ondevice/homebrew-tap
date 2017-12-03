# ondevice homebrew-tap

macOS homebrew tap for the [ondevice][ondevice] commandline client.

You can install this using:

```sh
brew install ondevice/tap/ondevice
```

After that, use `ondevice login` to authenticate.

See [docs.ondevice.io](https://docs.ondevice.io/) for details.


## Running the device daemon

If you want to be able to access your Mac using `ondevice ssh` on other computers, you'll have to start `ondevice daemon`
(and make sure you've used a 'device' key to authenticate when running `ondevice login`).


To autostart `ondevice daemon`, use:

```sh
brew services start ondevice
```

Make sure you [enable your Mac's SSH server](https://superuser.com/a/104933).

Have a look at the main [ondevice][ondevice] repo for more detailed information.


[ondevice]: https://github.com/ondevice/ondevice
