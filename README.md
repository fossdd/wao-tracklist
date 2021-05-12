# wao-tracklist

The [`lists`](list) directory contains all WAO stations with their tracks played. This lists will weekly updated.

### How does it work?

A weekly github CI runs the [`save.sh`](save.sh), commit the changes them and push it.

The save script downloads from every station the tracklist for the whole week and add them to `lists/STATION` file.

The tracks will be greped with a regex from the downloaded html, makes it easy to maintain.
