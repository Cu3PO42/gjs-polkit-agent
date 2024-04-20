# GJS Polkit Agent

This is a GObject-based library that can be used to implement a Polkit agent.
While it is usable from any language that supports GObject Introspection, it is specifically designed for use with GJS.

libpolkit-agent itself is already compatible with GObject Introspection.
However, the specific implementation of GJS is incompatible with the way a callback is implemented by it.
This library implements an abstraction that is compatible with GJS' instrospection capabilities.

## Provenance

This library is extracted almost verbatim from the Gnome Shell source.

## License

This library is available under the same terms as Gnome Shell: GPLv2 or later.
