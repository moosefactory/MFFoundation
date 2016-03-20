#!/bin/sh

#  headerdoc-make.sh
#  MFFoundation
#
#  Created by Tristan Leblanc on 19/03/16.
#  Copyright © 2016 MooseFactory. All rights reserved.

headerdoc2html -p -j MFFoundation/Maths/MFMathUtilities.h -o HeaderDocs
headerdoc2html -p -j MFFoundation/Maths/MFFastTrigo.h -o HeaderDocs

./appledoc.sh