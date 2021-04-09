# wao-tracklist

The [`list`](list) file contains all tracks played in a WAO station. This list will weekly updated.

Currently does the file contain 13034 lines and it will grow and grow.

### Who does it work?

A weekly github CI runs the [`save.sh`](save.sh), commit them and push it.

The save script downloads from every station the tracklist for the whole week and add them to the [`list`](list) file.

The tracks will be greped with a regex from the downloaded html, makes it easy to maintain.
