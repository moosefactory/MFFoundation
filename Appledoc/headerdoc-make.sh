#!/bin/sh

#  headerdoc-make.sh
#  MFFoundation
#
#  Created by Tristan Leblanc on 19/03/16.
#  Copyright © 2016 MooseFactory. All rights reserved.

headerdoc2html -p -j ../MFFoundation/MFTypes.h -o HeaderDocs

headerdoc2html -p -j ../MFFoundation/Extras/NSArray+MFExtras.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Extras/NSData+MFExtras.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Extras/NSDate+MFExtras.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Extras/NSDate+MFExtrasFormat.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Extras/NSDictionary+MFExtras.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Extras/NSFileManager+MFExtras.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Extras/NSString+MFExtras.h -o HeaderDocs


headerdoc2html -p -j ../MFFoundation/Dates/MFDateRange.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Dates/MFDateUtils.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Dates/MFPeriod.h -o HeaderDocs

headerdoc2html -p -j ../MFFoundation/Formatters/MFChronoTimeFormatter.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Formatters/MFMoneyFormatter.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Formatters/MFSingularPluralFormatter.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Formatters/MFLatLongFormatter.h -o HeaderDocs

headerdoc2html -p -j ../MFFoundation/Maths/MFMathUtilities.h -o HeaderDocs
headerdoc2html -p -j ../MFFoundation/Maths/MFFastTrigo.h -o HeaderDocs

headerdoc2html -p -j ../MFFoundation/System/SystemUtils.h -o HeaderDocs


./appledoc.sh

cp -R ~/help/MooseFactorySoftware/MFFoundation ~/Library/Developer/Shared/Documentation/DocSets
