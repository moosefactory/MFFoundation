![MacDown logo](./MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Extras/NSFileManager+MFExtras.h) - [Source File](../MFFoundation/Extras/NSFileManager+MFExtras.m)

------


## <font color='#1E72AD'>NSFileManager+MFExtras</font>

***

### isPathDirectoryEmpty: isDirectory: fileExists:
Returns true if a given directory at given path is empty.<br><br>
**isDirectory** is set to YES on output if the given path is a directory.<br>
**fileExists** is set to YES on output if the file item exists.<br>
<br><br>
<tt>**-(BOOL)isPathDirectoryEmpty:(NSString*)path  isDirectory:(BOOL*)isDirectory fileExists:(BOOL*)fileExists;
**</tt>
<br><br>

-------

### -isPathDirectoryEmpty: isDirectory: fileExists: recursive:
Returns true if a given directory at given path is empty.<br><br>
If **recursive** is true, then it returns true if directory is empty, or contains only empty folders.
**isDirectory** is set to YES on output if the given path is a directory.<br>
**fileExists** is set to YES on output if the file item exists.<br>
<br><br>
<tt>**-(BOOL)isPathDirectoryEmpty:(NSString*)path  isDirectory:(BOOL*)isDirectory fileExists:(BOOL*)fileExists recursive:(BOOL)recursive;
**</tt>
<br><br>

-------
### -directoryContainsOnlyInvisibleFiles: containsInvisibleFolders:
<br>
Returns true if a given directory contains only invisible files.

Returns YES in **containsInvisibleFolders** if the folder contains invisible folders.
 
*For performances reason, the algorithm breaks at first visible file.*<br>
*So if folder does not contains only invisible files, **containsInvisibleFolders** has no meaning.*
 
**containsInvisibleFolders**  is set to YES on output if the folder contains only invisible files and has invisible folders
<br><br>
<tt>**-(BOOL)directoryContainsOnlyInvisibleFiles:(NSString*)path containsInvisibleFolders:(BOOL*)containsInvisibleFolders;
**</tt>
<br><br>

-------
### -directoryContainsOnlyInvisibleFiles: containsInvisibleFolders:  recursive:
<br>
Returns true if a given directory contains only invisible files.

Returns YES in **containsInvisibleFolders** if the folder contains invisible folders.
 
*For performances reason, the algorithm breaks at first visible file.*<br>
*So if folder does not contains only invisible files, **containsInvisibleFolders** has no meaning.*
 
If **recursive** is true, then it returns true if directory and subdirectories contains only invisible files and folders. Visible subdirectories containing only invisible items are considered invisible<br>

**containsInvisibleFolders**  is set to YES on output if the folder contains only invisible files and has invisible folders
<br><br>
<tt>**-(BOOL)directoryContainsOnlyInvisibleFiles:(NSString*)path containsInvisibleFolders:(BOOL*)containsInvisibleFolders recursive:(BOOL)recursive;
**</tt>
<br><br>

-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)