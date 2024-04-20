project('gjs-polkit-agent',
  'c',
  version: '0.1.0',
  meson_version: '>= 0.62.0',
  license: ['GPL-2.0-or-later'],
  default_options: [ 'warning_level=2', 'werror=false', ],
)

prefix = get_option('prefix')
libdir = join_paths(prefix, get_option('libdir'))
datadir = join_paths(prefix, get_option('datadir'))

dependency('gobject-introspection-1.0', version: '>= 1.49.1')

libsources = ['src/shell-polkit-agent.c', 'src/shell-polkit-agent.h']
gjspolkitagent = shared_library(
  'gjspolkit',
  sources: libsources,
  dependencies: [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('polkit-agent-1')
  ],
  install: true
)

gnome = import('gnome')
gir = gnome.generate_gir(
  gjspolkitagent,
  sources: libsources,
  nsversion: '0.1',
  namespace: 'GjsPolkit',
  # The prefixes don't match the namespace due to the extraction from Gnome Shell.
  symbol_prefix: 'shell',
  identifier_prefix: 'Shell',
  includes: ['GObject-2.0', 'Gio-2.0', 'PolkitAgent-1.0'],
  install_dir_gir: datadir,
  install_dir_typelib: libdir,
  install: true
)[0]

