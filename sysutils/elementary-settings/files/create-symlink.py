#!/usr/bin/env python3

import os
import pathlib
import sys

def remove_prefix(path, prefix):
	p = pathlib.Path(path)
	return '{0}'.format(p.relative_to(prefix))

def new_prefix(basename, prefix):
	'''Return pathlib.Path object.'''
	p = pathlib.Path(prefix)
	return p.joinpath(basename)

# Variables from meson.add_install_script() function
xml_file = sys.argv[1]
dst_dir = remove_prefix(sys.argv[3], os.environ['MESON_INSTALL_PREFIX'])

# Find relative path between sys.argv[2] and sys.argv[3]
rel_dir = os.path.relpath(sys.argv[2], sys.argv[3])

p = new_prefix(dst_dir, os.environ['MESON_INSTALL_DESTDIR_PREFIX'])
if not p.exists():
    p.mkdir(parents=True)
dst = p.joinpath(xml_file)

# We want a 'string' object
src = '{0}'.format(pathlib.Path(rel_dir).joinpath(xml_file))

# Create symlink
# https://docs.python.org/3/library/pathlib.html#pathlib.Path.symlink_to
if isinstance(dst, pathlib.Path):
    dst.symlink_to(src)
