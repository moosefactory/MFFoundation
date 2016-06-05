![MFFoundationHeader](MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Extras/NSDictionary+MFExtras.h) - [Source File](../MFFoundation/Extras/NSDictionary+MFExtras.m)

------


## <font color='#1E72AD'>NSDictionary+MFExtras</font>

***

dictionaryWithName:
dictionaryWithName:
localizedDictionaryWithName:
localizedDictionaryWithName:
alphabeticallySortedKeys

### +dictionaryWithName:
<br>
Returns a dictionary with given file name ( without extension ).<br>
<br>
<tt>**+(NSDictionary*)dictionaryWithName:(NSString*)name;**</tt>
<br><br>

-------


### +dictionaryWithName:type:
<br>
Returns a dictionary with given file name ( without extension ).<br>
Type can be either 'plist', to return a standard dictionary,
or 'strings', to return a .strings file as a dictionary.


	<dict>
		<key>stringKey</key>
		<string>A string</string>
		...
	</dict>
	
	
<tt>**+(NSDictionary*)localizedDictionaryWithName:(NSString*)name type:(NSString*)type;**</tt>
<br><br>

-------

### +localizedDictionaryWithName:

<br>
Returns a dictionary with given file name ( without extension ).<br>
Searches in localized .lproj folder.
<br><br>
<tt>**+(NSDictionary*)localizedDictionaryWithName:(NSString*)name;**</tt>
<br><br>

-------

### +localizedDictionaryWithName:type:

<br>
Returns a localized dictionary from a file.<br>
Type can be either 'plist', to return a standard dictionary,
or 'strings', to return a .strings file as a dictionary.

	<dict>
		<key>stringKey</key>
		<string>A localized string</string>
		...
	</dict>
	
<tt>**+(NSDictionary*)localizedDictionaryWithName:(NSString*)name type:(NSString*)type;**</tt>
<br>

-------
### -alphabeticallySortedKeys

<br>
Returns the dictionary keys alphabetically sorted.<br>
<br>
<tt>**-(NSArray*)alphabeticallySortedKeys;**</tt>
<br>


-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)