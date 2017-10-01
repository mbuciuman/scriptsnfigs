#!/usr/bin/env python
from itertools import chain
import codecs
import sys

from fontTools.ttLib import TTFont
from fontTools.unicode import Unicode

ttf = TTFont(sys.argv[1], 0, verbose=0, allowVID=0,
                        ignoreDecompileErrors=True,
                                        fontNumber=-1)

chars = chain.from_iterable([y + (Unicode[y[0]],) for y in x.cmap.items()] for x in ttf["cmap"].tables)
chars_vals = [char[:1] for char in list(chars)]
flattened_chars_vals = []
for x in chars_vals:
    for y in x:
        flattened_chars_vals.append(y)

UTF8Writer = codecs.getwriter('utf8')
sys.stdout = UTF8Writer(sys.stdout)
for char in flattened_chars_vals:
    print(u''+unichr(char))

# Use this for just checking if the font contains the codepoint given as
# second argument:
#char = int(sys.argv[2], 0)
#print(Unicode[char])
#print(char in (x[0] for x in chars))

ttf.close()
